package com.hrms.project4th.mvc.entity;

import java.time.LocalDateTime;

public class Employees {
    //사원번호
    private long empNo;

    //사원이름
    private String empName;

    //사원생일
    private LocalDateTime empBirthDay;

    //사원 입사일
    private LocalDateTime empHireDate;

    //사원 이메일
    private String empEmail;

    //사원 성별
    private Gender empGender;

    //사원 급여
    private long empSalary;

    //사원 직속 상사
    private long empMyBoss;

    //사원 직급
    private long posCode;

    //사원 동호회
    private long clubCode;

    //사원 직책
    private long roleNo;

}