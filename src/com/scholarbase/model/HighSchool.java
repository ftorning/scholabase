package com.scholarbase.model;

public class HighSchool {
	private String school_id;
	private State state;
	private String name;
	private boolean is_impoverished;
	private boolean is_public;
	
	
	
	public HighSchool(String school_id, State state, String name, boolean is_impoverished, boolean is_public) {
		super();
		this.school_id = school_id;
		this.state = state;
		this.name = name;
		this.is_impoverished = is_impoverished;
		this.is_public = is_public;
		
		
	}
	
	public HighSchool(String school_id){
	//create a new College object by executing a query based on the college id. Might need to go in another class
}
	
	public String getHighSchool_id() {
		return school_id;
	}
	
	public State getState() {
		return state;
	}
	
	public String getName() {
		return name;
	}
	
	public boolean isIs_impoverished() {
		return is_impoverished;
	}
	
	public boolean isIs_public() {
		return is_public;
	}
	public void setHighSchool_id(String school_id) {
		this.school_id = school_id;
	}
	
	public void setState(State state) {
		this.state = state;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setIs_impoverished(Boolean is_impoverished) {
		this.is_impoverished = is_impoverished;
	}
	
	public void setIs_public(Boolean is_public) {
		this.is_public = is_public;
	}
	
	//creating the mutators, although not sure if needed since pre-defined
}
