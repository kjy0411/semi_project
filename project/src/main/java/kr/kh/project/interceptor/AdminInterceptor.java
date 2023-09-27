package kr.kh.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.project.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		//세션에 회원 정보가 없으면 메인 페이지로 이동
		Object user2 = request.getSession().getAttribute("user");
		//로그인 하지 않았으면
		if(user2 == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			//기존에 가려던 URL은 방문하지 않고 메인으로 이동
			return false;
		}
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		//관리자 권한이 아니면
		if(!user.getMe_authority().equals("ADMIN")) {
			//메인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/member/login");
			//기존에 가려던 URL은 방문하지 않고 메인으로 이동
			return false;
		}
		//로그인 했으면 기존에 가려던 URL을 방문해서 작업 
		return true;
	}

}
