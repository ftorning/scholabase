package com.scholarbase.model;

public class Student implements Cloneable {
	  
	  private String ssn;
	  private String name;
	  private String street, city;
	  private State res_state;
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
	  
	 
	  public Student(String ssn, String name, String street, String city, State res_state, String sex, boolean us_citizen,
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

	public String getSsn() {
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

	public State getRes_state() {
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

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setRes_state(State abbr) {
		this.res_state = abbr;
	}

	public String setSex() {
		return sex;
	}

	public boolean setUs_citizen() {
		return us_citizen;
	}

	public String setDob() {
		return dob;
	}

	public String setEthnicity() {
		return ethnicity;
	}

	public College setCollege() {
		return college;
	}

	public String setMajor() {
		return major;
	}

	public double setCollege_gpa() {
		return college_gpa;
	}

	public String setHs() {
		return hs;
	}

	public int setHs_grad_year() {
		return hs_grad_year;
	}

	public int setHs_class_rank() {
		return hs_class_rank;
	}

	public double setHs_gpa() {
		return hs_gpa;
	}
}

