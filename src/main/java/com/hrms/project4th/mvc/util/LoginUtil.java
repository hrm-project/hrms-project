package com.hrms.project4th.mvc.util;

import com.hrms.project4th.mvc.dto.responseDTO.LoginUserResponseDTO;
import org.apache.taglibs.standard.lang.jstl.NullLiteral;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtil {

    // 로그인 세션 키
    public static final String LOGIN_KEY =  "login";
    // 자동로그인 쿠키 이름
    public static final String AUTO_LOGIN_COOKIE =  "auto";
    // 로그인 여부 확인
    public static boolean isLogin(HttpSession session){
        return session.getAttribute(LOGIN_KEY) != null;
    }

    // 로그인한 사람의 사원번호를 반환하는 메서드
    public static String getCurrentLoginMemberAccount(HttpSession session){

        LoginUserResponseDTO loginUserInfo =
                (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return loginUserInfo.getEmpNo();

    }

    // 자동로그인 여부 확인
    public static boolean isAutoLogin(HttpServletRequest request){
        return WebUtils.getCookie(request, AUTO_LOGIN_COOKIE) != null;
    }

    // 관리자인지 확인해주는 메서드
    public static boolean isAdmin(HttpSession session){
        LoginUserResponseDTO loginUser
                = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);

        return loginUser.getAuth().equals("ADMIN");


    }
    // 내가 쓴 게시물인지 확인해주는 메서드

    public static boolean isMine(HttpSession session, String targetAccount){
        return targetAccount.equals(getCurrentLoginMemberAccount(session));
    }

}