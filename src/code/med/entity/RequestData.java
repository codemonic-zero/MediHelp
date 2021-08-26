package code.med.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="requesttb")
public class RequestData {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String rname,remail,rmobile,rmedname,rmfactname,
	rmfactdate,rexpirydate,rngo,filname,status;
	
	
	
	public RequestData() {
		super();
	}

	
	public String getFilname() {
		return filname;
	}


	public void setFilname(String filname) {
		this.filname = filname;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRemail() {
		return remail;
	}

	public void setRemail(String remail) {
		this.remail = remail;
	}

	public String getRmobile() {
		return rmobile;
	}

	public void setRmobile(String rmobile) {
		this.rmobile = rmobile;
	}

	public String getRmedname() {
		return rmedname;
	}

	public void setRmedname(String rmedname) {
		this.rmedname = rmedname;
	}

	public String getRmfactname() {
		return rmfactname;
	}

	public void setRmfactname(String rmfactname) {
		this.rmfactname = rmfactname;
	}

	public String getRmfactdate() {
		return rmfactdate;
	}

	public void setRmfactdate(String rmfactdate) {
		this.rmfactdate = rmfactdate;
	}

	public String getRexpirydate() {
		return rexpirydate;
	}

	public void setRexpirydate(String rexpirydate) {
		this.rexpirydate = rexpirydate;
	}

	public String getRngo() {
		return rngo;
	}

	public void setRngo(String rngo) {
		this.rngo = rngo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
}

