package code.med.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="donatetb")
public class Donate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String ngo,dname,demail,dmobile,medname,mfactname,quantity,mfactdate,expirydate,price;
	
	@CreationTimestamp
	private LocalDateTime created;
	
	public Donate() {
		super();
	}
	
	public LocalDateTime getCreated() {
		return created;
	}

	public void setCreated(LocalDateTime created) {
		this.created = created;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDemail() {
		return demail;
	}

	public void setDemail(String demail) {
		this.demail = demail;
	}

	public String getDmobile() {
		return dmobile;
	}

	public void setDmobile(String dmobile) {
		this.dmobile = dmobile;
	}

	public String getNgo() {
		return ngo;
	}

	public void setNgo(String ngo) {
		this.ngo = ngo;
	}

	public String getMedname() {
		return medname;
	}

	public void setMedname(String medname) {
		this.medname = medname;
	}

	public String getMfactname() {
		return mfactname;
	}

	public void setMfactname(String mfactname) {
		this.mfactname = mfactname;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getMfactdate() {
		return mfactdate;
	}

	public void setMfactdate(String mfactdate) {
		this.mfactdate = mfactdate;
	}

	public String getExpirydate() {
		return expirydate;
	}

	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
