import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// "num" 이라는 파라미터 명으로 전달된 문자열 읽어오기 
		String strNum=req.getParameter("num");
		// 문자열을 만일 정수로 바꾸고 싶으면?
		int num=Integer.parseInt(strNum);
		//응답 한글 인코딩 설정 
		resp.setCharacterEncoding("utf-8");
		//응답 content type 설정 (html 페이지를 응답 하겠다고 알리기)
		resp.setContentType("text/html;charset=utf-8");
		
		//요청한 클라이언트에게 문자열을 출력할수 있는 객체
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>자세히 보기 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>"+num+" 번 자세히 보기 ok!</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	
	}
}
