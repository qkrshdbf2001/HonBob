package egovframework.example.member;


import java.util.Date;

import org.springframework.web.bind.annotation.RequestParam;

public class Member {
	private int ucode;
	private String userid;
	private String pwd;
	private String name;
	private int year;
	private int month;
	private int day;
	private String sex;
	private String email;
	private String zipNo;
	private String roadAddrPart1;
	private String addrDetail;
	private String birthDayString;
	private Date birthDay;
	
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getUserid() {
		
		return userid.trim();
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getBirthDayString() {
		return year + "-" + month + "-" + day;
	}
	public void setBirthDayString(String birthDayString) {
		this.birthDayString = birthDayString;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	
	@Override
	public String toString() {
		return "Member [ucode=" + ucode + ", userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", year=" + year
				+ ", month=" + month + ", day=" + day + ", sex=" + sex + ", email=" + email + ", zipNo=" + zipNo
				+ ", roadAddrPart1=" + roadAddrPart1 + ", addrDetail=" + addrDetail + ", birthDayString="
				+ birthDayString + ", birthDay=" + birthDay + "]";
	} 
	
}
