package com.scholarbase.model;

public class State {
	private String abbr;
	private String name;
	
	public State(String abbr, String name) {
		super();
		this.abbr = abbr;
		this.name = name;
	}
	
	public State(){
	
	}
	
	public String getAbbr() {
		return abbr;
	}
	
	public String getName() {
		return name;
	}
	
	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
}
