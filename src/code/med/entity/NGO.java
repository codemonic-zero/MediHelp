package code.med.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="ngotb")
public class NGO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String ngoname,ngoemail,ngopass,naddress,pincode,type;
	
	@CreationTimestamp
	private LocalDateTime created;
	
	public NGO() {
		super();
	}
	
	public String getNaddress() {
		return naddress;
	}

	public void setNaddress(String naddress) {
		this.naddress = naddress;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNgoname() {
		return ngoname;
	}

	public void setNgoname(String ngoname) {
		this.ngoname = ngoname;
	}

	public String getNgoemail() {
		return ngoemail;
	}

	public void setNgoemail(String ngoemail) {
		this.ngoemail = ngoemail;
	}

	public String getNgopass() {
		return ngopass;
	}

	public void setNgopass(String ngopass) {
		this.ngopass = ngopass;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalDateTime getCreated() {
		return created;
	}

	public void setCreated(LocalDateTime created) {
		this.created = created;
	}
	
	
}

