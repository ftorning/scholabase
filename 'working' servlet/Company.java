package cs500.sch.ScholarBasePk;

public class Company {
	
	private int companyId;
	private String name;
	private String state;
	private String industry;
	private boolean is_public;
	
	public Company(int companyId, String name, String state, String industry, boolean is_public) {
		super();
		this.companyId = companyId;
		this.name = name;
		this.state = state;
		this.industry = industry;
		this.is_public = is_public;
	}

	public int getCompanyId() {
		return companyId;
	}

	public String getName() {
		return name;
	}

	public String getState() {
		return state;
	}

	public String getIndustry() {
		return industry;
	}

	public boolean isIs_public() {
		return is_public;
	}

	public String toHTML() {
		return "<tr><td>" + companyId + "</td><td>" + name + "</td></tr>";
  }
}


