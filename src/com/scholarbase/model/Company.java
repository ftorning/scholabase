package com.scholarbase.model;

public class Company {
	private String company_id;
	private String name;
	private State state;
	private String industry;
	private Boolean is_publicly_held;
		
	public Company(String company_id, String name, State state, String industry, Boolean is_publicly_held) {
		super();
		this.company_id = company_id;
		this.name = name;
		this.state = state;
		this.industry = industry;
		this.is_publicly_held = is_publicly_held;
	}
	
	public Company(){
	
	}
	
	public String getCompany_id() {
		return company_id;
	}
	
	public String getName() {
		return name;
	}
	
	public State getState() {
		return state;
	}
	
	public String getIndustry() {
		return industry;
	}
	
	public boolean isIs_Publicy_Held() {
		return is_publicly_held;
	}
	

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setState(State state) {
		this.state = state;
	}
	
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	public void setIs_Publicy_Held(Boolean is_publicly_held) {
		this.is_publicly_held = is_publicly_held;
	}
	
	
}
