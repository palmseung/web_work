package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  /detail?num=1
 *  /detail?num=2
 *  /detail?num=3
 *  
 *  - 위와 같은 요청을 해 올 때, 아래의 서블릿에 있는 service() 메소드가 호출된다.
 *  - ?num=x 형식으로 전달되는 것을 GET 방식 요청 파라미터라고 한다.
 *  - 요청 파라미터는 HttpServletRequest 객체를 이용해서 추출할 수 있다.
 */

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//"num" 이라는 파라미터명으로 전달된 문자열 읽어오기
		String strNum=req.getParameter("num");
		// 문자열을 만일 정수로 바꾸고 싶다면?
		int num=Integer.parseInt(strNum);
		
		
		//응답 한글 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 content type 설정(html 페이지를 응답하겠다고 알리기)
		resp.setContentType("text/html;charset=utf-8");
		//요청한 클라이언트(콘솔이 아니라 클라이언트!!!, 웹브라우저가 클라이언트면 웹브라우저에 출력)에게 문자열을 출력할 수 있는 객체
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>자세히 보기 페이지</title>");
		pw.println("<link rel='stylesheet' href='/Step01_Servlet/Resources/css/bootstrap.css'/>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div class='container'>");
			pw.println("<p>"+num+" 번 자세히 보기 ok!</p>");
			pw.println("<a class='btn btn-primary' href='/Step02_Request/index.jsp'>인덱스로 가기</a>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
		
	}
}
