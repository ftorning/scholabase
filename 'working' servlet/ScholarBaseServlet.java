package cs500.sch;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 *
 */
public class ScholarBaseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ScholarBase _scb;
    private String _message;

    public void init() throws ServletException {
	_scb = new ScholarBase();
	_message = _scb.openDBConnection("PgBundle");
    }

    public void printCompanySponsors(PrintWriter out) {

	
	try {
		out.println("<HTML>");
		out.println("<HEAD> <TITLE> The JDBCQuery JSP  </TITLE> </HEAD>");
		out.println("<BODY BGCOLOR=\"white\">");


		out.println("<B>Enter a search condition:</B>");
		out.println("<FORM ACTION=\"ScholarBaseServlet\" METHOD=\"post\"> ");
		out.println("<INPUT TYPE=\"text\" NAME=\"cond\" SIZE=30>");
		out.println("<INPUT TYPE=\"submit\" VALUE=\"Ask Oracle\");");
		out.println("</FORM>");
		out.println("</BODY>");
		out.println("</HTML>");
	} //catch (SQLException sqle) {
		catch (Exception sqle) {
	    sqle.printStackTrace(out);
	}
	
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
  
	response.setContentType("text/html");

	PrintWriter out = response.getWriter();
	out.println("<html><head></head><body>");
      
	if (!_message.startsWith("Servus")) {
	    out.println("<h1>Databaase connection failed to open " + _message + "</h1>");
	} else {
	    printCompanySponsors(out);
		try {out.println(buildQuery());} catch (SQLException e) {out.println("error");}
	}
	  
	out.println("</table>");
	out.println("</html>");
    }
  
    public void doPost(HttpServletRequest inRequest, HttpServletResponse outResponse) 
	throws ServletException, IOException {  
		PrintWriter out = outResponse.getWriter();
		try {
		out.println(buildQuery());
		} catch (SQLException e){e.printStackTrace(out);}
    }

    public void destroy() {
	_scb.closeDBConnection();
    }
	
		public void printaform(PrintWriter out){

	}
	
	private String buildQuery() throws SQLException
	{
	 
	 return _scb.doQuery("select company.name, scholarship.title, scholarship.dollar_value from company join scholarship on company.company_id = scholarship.company_id");
	}
	/*
	{
		"select student.name from students join college on students.college_id = college.college_id where college.isPublic = "  + TRUE/FALSE VAR
	}*/
	
	/*
		"select name company, count(sco_id) scholarships_offered
		from company join scholarship where company.sco_id = scholarship.sco_id
		group by company
		order by count(sco_id) desc
		limit +" x
		*/
	
	 
}

