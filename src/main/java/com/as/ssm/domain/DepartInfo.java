package com.as.ssm.domain;

public class DepartInfo {

	private Integer departid;
	private String departname;
	private String departemail;
	private String departtel;
	private String departdesc;
	public Integer getDepartid() {
		return departid;
	}
	public void setDepartid(Integer departid) {
		this.departid = departid;
	}
	public String getDepartname() {
		return departname;
	}
	public void setDepartname(String departname) {
		this.departname = departname;
	}
	public String getDepartemail() {
		return departemail;
	}
	public void setDepartemail(String departemail) {
		this.departemail = departemail;
	}
	public String getDeparttel() {
		return departtel;
	}
	public void setDeparttel(String departtel) {
		this.departtel = departtel;
	}
	public String getDepartdesc() {
		return departdesc;
	}
	public void setDepartdesc(String departdesc) {
		this.departdesc = departdesc;
	}
	
	public DepartInfo() {}
	public DepartInfo(Integer departid, String departname, String departemail, String departtel, String departdesc) {
		super();
		this.departid = departid;
		this.departname = departname;
		this.departemail = departemail;
		this.departtel = departtel;
		this.departdesc = departdesc;
	}
	@Override
	public String toString() {
		return "DepartInfo [departid=" + departid + ", departname=" + departname + ", departemail=" + departemail
				+ ", departtel=" + departtel + ", departdesc=" + departdesc + "]";
	}
	
	

}
