package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.LoginRequestDTO;
import com.hrms.project4th.mvc.entity.LoginResult;
import com.hrms.project4th.mvc.service.EmployeesService;
import com.hrms.project4th.mvc.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.http.HttpRequest;

import static com.hrms.project4th.mvc.entity.LoginResult.SUCCESS;
import static com.hrms.project4th.mvc.entity.LoginResult.WRONG_PW;
import static com.hrms.project4th.mvc.util.LoginUtil.isAutoLogin;
import static com.hrms.project4th.mvc.util.LoginUtil.isLogin;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LoginController {

    private final LoginService loginService;
//    @GetMapping("/main")
//    public String mainPage(){
//
//        log.info("/main : GET 요청!");
//
//        return "/main/main-page";
//    }

    // 로그인 양식 요청
    @GetMapping("/log-in")
    public String loginPage(HttpServletRequest request) {
        log.info("/log-in :  GET - forwarding to jsp");


        String referer = request.getHeader("Referer");

        log.info("referer : {}", referer);
        return "main/login";
    }

    // 로그인 검증 요청
    @PostMapping("/log-in")
    public String loginPage(LoginRequestDTO dto
             // 리다이렉션시 2번째 응답에 데이터를 보내기 위함
            , RedirectAttributes ra
            , HttpServletRequest request
            , HttpServletResponse response
            , HttpSession session) {

        log.info("/log-in POST ! - {}", dto.getEmpEmail());

        LoginResult result = loginService.authenticate(dto, request.getSession(), response);

        // 로그인 성공시
        if (result == SUCCESS) {

            // 서버에서 세션 로그인 정보 저장
            loginService.maintainLoginState(request.getSession(), dto.getEmpEmail());


            return "redirect:/hrms/main-page";

        }
            // 1회용으로 쓰고 버릴 데이터
            ra.addFlashAttribute("msg", result);

            log.info(String.valueOf(result));
            // 로그인 실패시

            return "redirect:/main/login";

        }

    // 로그인 세션 적용해보기 //
    @GetMapping("/hrms/main-page")
    public String toHome(HttpServletRequest request){

        log.info("main-page redirect : GET!");
        return "main/main-page";
    }



    // 로그아웃
    @RequestMapping("/log-out")
    public String logout(HttpServletRequest request,
                         HttpServletResponse response){

        HttpSession session = request.getSession();
        // 로그인 중인지 확인
        if (isLogin(session)) {

            // 자동 로그인 상태라면 해제한다.
            if(isAutoLogin(request)){

                LoginService.autoLoginClear(request, response);
            }
            // 세션에서 login 정보를 제거
            session.removeAttribute("login");


            session.invalidate();
        return "redirect:/main/login";

    }

        return "redirect:/";
}


}
