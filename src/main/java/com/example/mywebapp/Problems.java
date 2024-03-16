package com.example.mywebapp;
import jakarta.persistence.*;

@Entity
public class Problems {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int probid;
	
	private String userid;
	private String probtitle;
	private String probdes;
	private String probstatus;
	
	public int getProbid() {
		return probid;
	}
	public void setProbid(int probid) {
		this.probid = probid;
	}
	
	public String getProbtitle() {
		return probtitle;
	}
	public void setProbtitle(String probtitle) {
		this.probtitle = probtitle;
	}
	public String getProbdes() {
		return probdes;
	}
	public void setProbdes(String probdes) {
		this.probdes = probdes;
	}
	public String getProbstatus() {
		return probstatus;
	}
	public void setProbstatus(String probstatus) {
		this.probstatus = probstatus;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	

}
