package com.park.mall.model;

import java.util.Date;

public class ReportVO {
	private String member_id;
	private String report_contents;
	private Date report_date;
	private String reporter_Id;
	public String getMember_id() {	
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReport_contents() {
		return report_contents;
	}
	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}
	
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public String getReporter_Id() {
		return reporter_Id;
	}
	public void setReporter_Id(String reporter_Id) {
		this.reporter_Id = reporter_Id;
	}
	@Override
	public String toString() {
		return "ReportVO [member_id=" + member_id + ", report_contents=" + report_contents + ", report_date="
				+ report_date + ", reporter_Id=" + reporter_Id + "]";
	}
	
}
	
	
	
