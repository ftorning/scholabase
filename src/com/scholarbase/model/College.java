package com.scholarbase.model;

public class College {
	
	private String college_id;
	private boolean is_public;
	private String name;
	private State state;
	
	public College(String college_id, boolean is_public, String name, State state) {
		super();
		this.college_id = college_id;
		this.is_public = is_public;
		this.name = name;
		this.state = state;
	}
	
	public College(String college_id){
	//create a new College object by executing a query based on the college id. Might need to go in another class
}
	//creating the mutators, although not sure if needed since pre-defined
	public String getCollege_id() {
		return college_id;
	}
	public boolean isIs_public() {
		return is_public;
	}
	public String getName() {
		return name;
	}
	public State getState() {
		return state;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	public void setIs_public(Boolean is_public) {
		this.is_public = is_public;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setState(State state) {
		this.state = state;
	}

}
