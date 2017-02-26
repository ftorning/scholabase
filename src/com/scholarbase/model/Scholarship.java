package com.scholarbase.model;

public class Scholarship {
	private int sco_id;
	private String title;
	private double dollar_value;
	private Company company;
	
	
	public Scholarship(int sco_id, String title, double dollar_value, Company company) {
		super();
		this.sco_id = sco_id;
		this.title = title;
		this.dollar_value = dollar_value;
		this.company = company;
	}
	
	public Scholarship(){
	
	}
	
	public int getID() {
		return sco_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public double getDollar_value() {
		return dollar_value;
	}
	
	public Company getCompany() {
		return company;
	}
	
	public void setID(int sco_id) {
		this.sco_id = sco_id;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setDollar_value(double dollar_value) {
		this.dollar_value = dollar_value;
	}
	
	public void setCompany(Company company) {
		this.company = company;
	}
	
}
