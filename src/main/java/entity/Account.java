package entity;

public class Account {
	private String username;
	private String password;
	private int type; // 1 is admin, 0 is customer
	private String email;
	public Account() {
		super();
	}
	public Account(String username, String password, int type, String email) {
		super();
		this.username = username;
		this.password = password;
		this.type = type;
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
