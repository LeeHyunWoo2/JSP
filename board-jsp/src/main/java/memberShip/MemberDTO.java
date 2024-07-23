package memberShip;

public class MemberDTO {
	// member 객체
	
	
	// 필드
	
	private String id;
	private String pass;
	private String name;
	private String regidate;
	
	
	public MemberDTO() {
		//기본 생성자
	};

	
	
	// 게터-세터 메서드
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRegidate() {
		return regidate;
	}


	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

}
