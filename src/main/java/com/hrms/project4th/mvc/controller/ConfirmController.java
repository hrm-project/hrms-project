package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.RequestConfirmDto;
import com.hrms.project4th.mvc.dto.ModifyConfirmDto;
import com.hrms.project4th.mvc.entity.Confirm;
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

    //결재 신청폼
    @GetMapping("/rq-form")
    public String writeRequest(){
        return "/rqform"; //jsp
    }

    //결재신청폼에서 받아온 값 DB에 전달
    @PostMapping("/rq-cofm")
    @ResponseBody
    public ResponseEntity<Boolean> requestConfirm(RequestConfirmDto dto){
        boolean flag = confirmService.requestConfirm(dto);
        return ResponseEntity.ok().body(flag);
    }

    //승인대기 리스트 불러오기
    @GetMapping("/waiting")
    @ResponseBody
    public ResponseEntity<List> getWaitingList(long empNo, @Nullable Long roleCode){
        List<Confirm> waitingList = confirmService.getWaitingList(empNo, roleCode);
        return ResponseEntity.ok().body(waitingList);
    }

    //승인 리스트 불러오기
    @GetMapping("/checked")
    @ResponseBody
    public ResponseEntity<List> getCheckedList(long empNo, Long roleCode){
        List<Confirm> checkedList = confirmService.getCheckedList(empNo, roleCode);
        return ResponseEntity.ok().body(checkedList);
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
    public ResponseEntity<Boolean> modify(ModifyConfirmDto dto){
        boolean flag = confirmService.modifyConfirm(dto);
        return ResponseEntity.ok().body(flag);
    }



}