package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.DeptBossDTO;
import com.hrms.project4th.mvc.dto.RequestConfirmDTO;
import com.hrms.project4th.mvc.dto.ModifyConfirmDTO;
import com.hrms.project4th.mvc.dto.SimpleDateConfirmDTO;
import com.hrms.project4th.mvc.service.ConfirmService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/confirm")
public class ConfirmController {

    private final ConfirmService confirmService;

    @GetMapping("list")
    public String confirmList(){
        return "confirm/confirmList";
    }

    //결재 신청폼
    @GetMapping("/rq-form")
    public String writeRequest(String deptCode, Model model){ //추후 코드 변경 : 세션에서 로그인 객체 넘겨받아 부서 확인하기
        DeptBossDTO deptBoss = confirmService.getDeptBoss("001");
        model.addAttribute("boss", deptBoss);
        return "confirm/confirm-rqform"; //jsp
    }

    //결재신청폼에서 받아온 값 DB에 전달
    @PostMapping("/rq-cnfm")
    @ResponseBody
    public ResponseEntity<Boolean> requestConfirm(RequestConfirmDTO dto){
        boolean flag = confirmService.requestConfirm(dto);
        return ResponseEntity.ok().body(flag);
    }

    //승인대기 리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/waiting")
    @ResponseBody
    public ResponseEntity<List> getWaitingList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> waitingList = confirmService.getWaitingList(empNo, roleCode);
        return ResponseEntity.ok().body(waitingList);
    }

    //승인 리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/checked")
    @ResponseBody
    public ResponseEntity<List> getCheckedList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> checkedList = confirmService.getCheckedList(empNo, roleCode);
        return ResponseEntity.ok().body(checkedList);
    }

    //반려리스트 불러오기
    @GetMapping("/{empNo}/{roleCode}/rejected")
    @ResponseBody
    public ResponseEntity<List> getRejectedList(@PathVariable("empNo") long empNo, @PathVariable("roleCode") @Nullable String roleCode){
        List<SimpleDateConfirmDTO> rejectedList = confirmService.getRejectedList(empNo, roleCode);
        return ResponseEntity.ok().body(rejectedList);
    }

    //결재 승인하기
    @PostMapping("/check")
    @ResponseBody
    public ResponseEntity<Boolean> checkConfirm(long conNo){
        boolean flag = confirmService.checkConfirm(conNo);
        return ResponseEntity.ok().body(flag);
    }

    //승인거절하기
    @PostMapping("/reject")
    @ResponseBody
    public ResponseEntity<Boolean> rejectConfirm(long conNo){

        boolean flag = confirmService.rejectConfirm(conNo);
        return ResponseEntity.ok().body(flag);
    }

    //결재 수정폼으로 이동
    @GetMapping("/modify")
    public String modifyForm(long conNo){
        return "/modify";
    }

    //수정폼에서 값 받아서 DB에 전달
    @PutMapping
    @ResponseBody
    public ResponseEntity<Boolean> modify(ModifyConfirmDTO dto){
        boolean flag = confirmService.modifyConfirm(dto);
        return ResponseEntity.ok().body(flag);
    }



}