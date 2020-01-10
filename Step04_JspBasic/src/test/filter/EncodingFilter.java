package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	//필터가 동작되면 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("필터가 동작하네?");
		
		//1.인코딩이 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//post 방식 요청했을 때 한글 인코딩 설정
			request.setCharacterEncoding("utf-8");
		}
		//요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
