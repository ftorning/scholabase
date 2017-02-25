package scholarbase;

/**
 * 
 *  
 * @author Lewis Cannalongo 
 *
 */
public class Student {
  
  private String ssn;
  private String name;
  private String street, city, res_state;
  private String sex;
  private boolean us_citizen;
  private String dob;
  private String ethnicity;
  private College college;
  private String major;
  private double college_gpa;
  private String hs;
  private int hs_grad_year;
  private int hs_class_rank;
  private double hs_gpa;
  
 
  public Student(String ssn, String name, String street, String city, String res_state, String sex, boolean us_citizen,
			String dob, String ethnicity, String college, String major, double college_gpa, String hs, int hs_grad_year,
			int hs_class_rank, double hs_gpa) {
		super();
		this.ssn = ssn;
		this.name = name;
		this.street = street;
		this.city = city;
		this.res_state = res_state;
		this.sex = sex;
		this.us_citizen = us_citizen;
		this.dob = dob;
		this.ethnicity = ethnicity;
		this.college = new College(college);
		this.major = major;
		this.college_gpa = college_gpa;
		this.hs = hs;
		this.hs_grad_year = hs_grad_year;
		this.hs_class_rank = hs_class_rank;
		this.hs_gpa = hs_gpa;
	}

 

  public String toString() {
    return ssn + " : " + name;
  }
  
  public String toHTML() {
	  return "<tr><td>" + ssn + "</td><td>" + name + "</td></tr>";
  }

public int getSsn() {
	return ssn;
}

public String getName() {
	return name;
}

public String getStreet() {
	return street;
}

public String getCity() {
	return city;
}

public String getRes_state() {
	return res_state;
}

public String getSex() {
	return sex;
}

public boolean isUs_citizen() {
	return us_citizen;
}

public String getDob() {
	return dob;
}

public String getEthnicity() {
	return ethnicity;
}

public College getCollege() {
	return college;
}

public String getMajor() {
	return major;
}

public double getCollege_gpa() {
	return college_gpa;
}

public String getHs() {
	return hs;
}

public int getHs_grad_year() {
	return hs_grad_year;
}

public int getHs_class_rank() {
	return hs_class_rank;
}

public double getHs_gpa() {
	return hs_gpa;
}


}
