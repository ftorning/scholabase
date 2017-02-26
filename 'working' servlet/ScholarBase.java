package cs500.sch;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;

/**
 * 
 * Based on the Registrar implementation provided by Julia Stoyanovich (stoyanovich@drexel.edu) 
 *
 */
public class ScholarBase {
  
  private static Connection _conn = null;
  private static ResourceBundle _bundle;
  
  /**
   * 
   * @param bundle - resource bundle that contains database connection information
   * @return
   */     
  public String openDBConnection(String bundle) {
	 _bundle = ResourceBundle.getBundle(bundle);
	 return openDBConnection(
			 _bundle.getString("dbUser"), 
			 _bundle.getString("dbPass"),
			 _bundle.getString("dbSID"), 
			 _bundle.getString("dbHost"), 
			 Integer.parseInt(_bundle.getString("dbPort"))
			 );
  }
  
  /**
   * Open the database connection.
   * @param dbUser
   * @param dbPass
   * @param dbSID
   * @param dbHost
   * @return
   */
  public String openDBConnection(String dbUser, String dbPass, String dbSID, String dbHost, int port) {
    
    String res="";
    if (_conn != null) {
      closeDBConnection();
    }
  
    try {
       _conn = DBUtils.openDBConnection(dbUser, dbPass, dbSID, dbHost, port);
       res = DBUtils.testConnection(_conn);
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace(System.err);
    }
    return res;
  }
  
  /**
   * Close the database connection.
   */
  public void closeDBConnection() {
    try {
      DBUtils.closeDBConnection(_conn);
      System.out.println("Closed a connection");
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
  }
  
  /**
   * Register a new Company in the database.
   * @param newCompany
   * @return
   */
   /*
 
  public Company registerCompany(Company newCompany) {
    try {
      int sid = 1 + DBUtils.getIntFromDB(_conn, "select max(sid) from Company");
      newCompany.setId(sid);
      String query = "insert into Companys (sid, name) values ("  + 
                newCompany.getId() + ", '" + newCompany.getName() + "')";
      DBUtils.executeUpdate(_conn, query);
    } catch (SQLException sqle) {
       sqle.printStackTrace(System.err);
    }
    return newCompany;
  }
  */
  
  /**
   * Update the Company's GPA in the database.
   * @param sid
   * @param gpa
   * @return
   
  public Company setGPA(int sid, double gpa) {
    Company Company = null;
    try {
      int cnt = DBUtils.getIntFromDB(_conn, "select count(*) from Companys where sid = " + sid);
      if (cnt == 0) {
        return Company;
      }
      String query = "update Companys set gpa = " + gpa + " where sid = " + sid;
      DBUtils.executeUpdate(_conn, query);
      
      query = "select name, gpa from Companys where sid = " + sid;
      Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        rs.next();
        
        Company = new Company(sid, rs.getString("name"), rs.getDouble("gpa"));
        
        rs.close();
        st.close();
    } catch (SQLException sqle) {
      sqle.printStackTrace(System.err);
    }
    return Company;
  }
  */
  
  /**
   * Get the complete list of company sponsors
   * @return
   */
   public ArrayList<Company> getSponsors() throws SQLException {
     
       ArrayList<Company> sponsors = new ArrayList<Company>();
       
       String query = "select company_id, name, company_state, industry, is_publicly_held from company";
      
       Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
        
          String cid = rs.getString("company_id");
          String name = rs.getString("name");
          String state = rs.getString("company_state");
		  String industry = rs.getString("industry");
		  boolean is_public = rs.getBoolean("is_publicly_held");
          Company Company = new Company(cid, name, state, industry, is_public);
           
          sponsors.add(Company);
        }
        
        rs.close();
        st.close();

    return sponsors;
   
    }
	
	public String doQuery(String qry) throws SQLException 
	{
		StringBuffer sb = new StringBuffer();
		Statement st = _conn.createStatement();
        ResultSet rs = st.executeQuery(qry);
		
		if (!rs.next())
		{sb.append("<P> No matching rows</P>\n");}
		else { sb.append("<UL>");
			while (rs.next())
			{sb.append("<LI>company " + rs.getString(1) + " scholarship " +  rs.getString(2) + " value" + rs.getDouble(3) + "</LI>\n");}
			sb.append("</UL>");
		}
		return sb.toString();	
	
	}
  
  public void addTermsDynamicSQL(String [] terms) {
    
      for (int i=0; i<terms.length; i++) {
	    String term = terms[i];
	    try {
		String query = "insert into Terms values ('" + term + "')";
		DBUtils.executeUpdate(_conn, query);
	    } catch (SQLException sqle) {
		System.out.println("Insert into Terms failed for " + term);
	    }
      }
  }
  
  public void addTermsPreparedStatement(String [] terms) {
      try {
	  String query = "insert into Terms values ( ? )";
	  DBUtils.executeUpdate(_conn, query, terms);
      } catch (SQLException sqle) {
	  System.out.println(sqle.toString());
      }
  }
}
