package scholarbase;

public class College {
	private String college_id;
	private boolean is_public;
	private String name;
	private String state;
	
	public College(String college_id, boolean is_public, String name, String state) {
		super();
		this.college_id = college_id;
		this.is_public = is_public;
		this.name = name;
		this.state = state;
	}
	
	public College(String college_id){
	//create a new College object by executing a query based on the college id. Might need to go in another class
}
	
	public String getCollege_id() {
		return college_id;
	}
	public boolean isIs_public() {
		return is_public;
	}
	public String getName() {
		return name;
	}
	public String getState() {
		return state;
	}

}
