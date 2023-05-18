package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.dto.requestDTO.MyBossRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.GetMyBossResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeesService {

    private final EmployeesMapper employeesMapper;

    public List<Employees> getEmployeesList() {
       return employeesMapper.getEmployeesList();
    }

    public boolean addEmployee(AddEmployeesDTO dto) {
        Employees emp = new Employees(dto);
        return employeesMapper.addEmployee(emp);
    }

    public boolean removeEmployee(long empNo){
        return employeesMapper.removeEmployee(empNo);
    }

    public boolean modifyEmployees(ModifyEmployeeDTO dto) {
        Employees emp = Employees.builder()
                .empNo(dto.getEmpNo())
                .empEmail(dto.getEmpEmail())
                .empPassword(dto.getEmpPassword())
                .empSalary(dto.getEmpSalary())
                .empPhone(dto.getEmpPhone())
                .empMyBoss(dto.getEmpMyBoss())
                .posCode(dto.getPosCode())
                .roleCode(dto.getRoleCode())
                .deptCode(dto.getDeptCode())
                .build();
        return employeesMapper.modifyEmployees(emp);
    }

    public List<GetMyBossResponseDTO> getMyBossNames(MyBossRequestDTO dto) {
        log.info("service : {}, {}", dto.getDeptCode(), dto.getPosCode());
        return employeesMapper.getMyBossNames(dto)
                .stream()
                .filter(e -> e.getPosCode().compareTo(dto.getPosCode()) < 0)
                .map(GetMyBossResponseDTO::new)
                .collect(Collectors.toList());
    }

    public boolean isDuplicated(String email) {
        return employeesMapper.isDuplicated(email);
    }


    // 사원의 번호 수정
    public boolean updatePhoneNumber(String empEmail, String newPhoneNumber){


        Employees employee = employeesMapper.findEmployee(empEmail);

        if(employee == null){
            log.info("사용자를 찾지 못했습니다");
            return false;

        }


        employeesMapper.updatePhoneNumber(empEmail, newPhoneNumber);

        String empName = employeesMapper.findEmployee(empEmail).getEmpName();
        log.info( empName+ " 님의 휴대폰 번호가 정상적으로 수정되었습니다!");
        return true;
    }


}
