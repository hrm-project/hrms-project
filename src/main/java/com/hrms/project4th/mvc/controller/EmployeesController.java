package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.*;
import com.hrms.project4th.mvc.dto.responseDTO.GetMyBossResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.LoginUserResponseDTO;
import com.hrms.project4th.mvc.service.EmployeesService;
import com.hrms.project4th.mvc.service.LoginService;
import com.hrms.project4th.mvc.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

import static com.hrms.project4th.mvc.util.LoginUtil.getCurrentLoginMemberAccount;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/hrms/employees")
public class EmployeesController {
    private final LoginService loginService;
    private final EmployeesService employeesService;

    @Value("${file.upload.root-path}")
    private String rootPath;

    //사원 전체리스트 불러오기
    @GetMapping("/list")
    public String getEmployeesList() {
        employeesService.getEmployeesList();
        return "redirect:/employees/add"; //관리자 사원 전체보기 jsp
    }

    //사원추가 폼으로 이동
    @GetMapping("/add")
    public String addEmployee() {
        return "admin/addEmployee"; //jsp
    }

    //사원 추가 디비 반영
    @PostMapping("/add")
    public String addEmployee(AddEmployeesDTO dto) {
        String savePath = FileUtil.uploadFile(dto.getEmpPhone(), dto.getProfile(), rootPath);
        log.info(rootPath);
        employeesService.addEmployee(dto, savePath);
        return "redirect:/employees/add"; //전체사원 리스트로 리다이렉트
    }

    @GetMapping("/add/check")
    public ResponseEntity<Boolean> isDuplicated(String empEmail) {
        empEmail += "@samjosangsa.com";
        boolean flag = employeesService.isDuplicated(empEmail);
        return ResponseEntity.ok().body(flag);
    }

    //사원 수정 폼으로 이동
    @GetMapping("/modify")
//    public String modifyEmployees(long empNo){
    public String modifyEmployees() {
        long empNo = 2L;
        return "admin/modifyEmployee";
    }

    //사원 수정 디비 반영
    @PostMapping("/modify")
    public String modifyEmployees(ModifyEmployeeDTO dto) {
        employeesService.modifyEmployees(dto);
        return "admin/modifyEmployee"; //리스트로 리다이렉트로 변경 예정 !
    }

    //사원 삭제
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<Boolean> removeEmployee(long empNo) {
        boolean flag = employeesService.removeEmployee(empNo);
        return ResponseEntity.ok().body(flag);
    }

    @GetMapping("/boss/{dept}/{pos}")
    @ResponseBody
    public ResponseEntity<List> getDeptName(@PathVariable("dept") String dept, @PathVariable("pos") String pos) {
        log.info("controller : {}, {}", dept, pos);
        List<GetMyBossResponseDTO> bossNames = employeesService.getMyBossNames(
                MyBossRequestDTO.builder()
                        .deptCode(dept)
                        .posCode(pos)
                        .build());
        return ResponseEntity.ok().body(bossNames);
    }


    @GetMapping("/updatePhoneNumber")
    public String modifyMyPhone() {
        log.info("/updatePhoneNumber : GET 요청!");


        return "admin/modifyMyInfo";
    }


    // 사원 번호 수정하기
    // fetch 로 처리 시도 중
    @PutMapping("/updatePhoneNumber")
    public ResponseEntity<?> updatePhoneNumber(
            @RequestBody String newPhoneNumber,
            BindingResult result, HttpServletRequest request) {
        String newPhone = newPhoneNumber;

        String empEmail = getCurrentLoginMemberAccount(request.getSession());


        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.toString());
        }

        log.info("요청 :/updatePhoneNumber : PUT!! ", newPhone);


        try {

            boolean success = employeesService.updatePhoneNumber(newPhone, empEmail);

            if (success) {
                return ResponseEntity.ok("성공");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("실패ㅠ");
            }
        } catch (Exception e) {
            log.error("Error occurred while updating phone number: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while updating the phone number.");
        }

    }


}
