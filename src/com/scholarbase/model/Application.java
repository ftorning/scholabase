package com.scholarbase.model;

public class Application {
	private int app_id;
	private String short_essay;
	private String reference_name;
	private String reference_email;
	private String reference_type;
	private boolean reference_verified;
	private Student student;
	private Scholarship scholarship;
	
	public Application(int app_id, String short_essay, String reference_name,
						String reference_email, String reference_type, 
						boolean reference_verified, Student student, Scholarship scholarship) {
		super();
		this.app_id = app_id;
		this.short_essay = short_essay;
		this.reference_name = reference_name;
		this.reference_email = reference_email;
		this.reference_type = reference_type;
		this.reference_verified = reference_verified;
		this.student = student;
		this.scholarship = scholarship;
	}
	
	public Application() {
		
	}
		
	public int getID() {
		return app_id;
	}
	
	public String getEssay() {
		return short_essay;
	}
	
	public String getReference_name() {
		return reference_name;
	}
	
	public String getReference_email() {
		return reference_email;
	}
	
	public String getReference_type() {
		return reference_type;
	}
	
	public boolean getReference_verified() {
		return reference_verified;
	}
	
	public Student getStudent() {
		return student;
	}
	
	public Scholarship getScholarship() {
		return scholarship;
	}
	
	public void setID(int app_id) {
		this.app_id = app_id;
	}
	
	public void setEssay(String short_essay) {
		this.short_essay = short_essay;
	}
	
	public void setReference_name(String reference_name) {
		this.reference_name = reference_name;
	}
	
	public void setReference_email(String reference_email) {
		this.reference_email = reference_email;
	}
	
	public void setReference_type(String reference_type) {
		this.reference_type = reference_type;
	}
	
	public void setReference_verified(boolean reference_verified) {
		this.reference_verified = reference_verified;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public void setScholarship(Scholarship scholarship) {
		this.scholarship = scholarship;
	}
	
	
	
	
}
