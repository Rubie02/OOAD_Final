package entity;

public class Customer {
	private int cusId;
	private String cusName;
	private String cusAddress;
	private String cusPhoneNumber;

	private String username;
	public Customer() {
		super();
	}
	public Customer(int cusId, String cusName, String cusAddress, String cusPhoneNumber,  String username) {
		super();
		this.cusId = cusId;
		this.cusName = cusName;
		this.cusAddress = cusAddress;
		this.cusPhoneNumber = cusPhoneNumber;

		this.username = username;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusPhoneNumber() {
		return cusPhoneNumber;
	}
	public void setCusPhoneNumber(String cusPhoneNumber) {
		this.cusPhoneNumber = cusPhoneNumber;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
