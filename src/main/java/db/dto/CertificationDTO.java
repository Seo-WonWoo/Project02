package db.dto;

public class CertificationDTO {
		
	int certificationId;
	String certificationName;	
	
	public CertificationDTO() {}	
	
	public CertificationDTO(int certificationId, String certificationName) {
		super();
		this.certificationId = certificationId;
		this.certificationName = certificationName;
	}
	
	public int getCertificationId() {
		return certificationId;
	}

	public void setCertificationId(int certificationId) {
		this.certificationId = certificationId;
	}

	public String getCertificationName() {
		return certificationName;
	}

	public void setCertificationName(String certificationName) {
		this.certificationName = certificationName;
	}
	
	
	
	
}
