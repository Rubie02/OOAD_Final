package entity;

public class Supplier {
	private int supId;
	private String supName;
	private String supAddress;
	private String supPhoneNumber;
	public Supplier() {
		super();
	}
	public Supplier(int supId, String supName, String supAddress, String supPhoneNumber) {
		super();
		this.supId = supId;
		this.supName = supName;
		this.supAddress = supAddress;
		this.supPhoneNumber = supPhoneNumber;
	}
	public int getSupId() {
		return supId;
	}
	public void setSupId(int supId) {
		this.supId = supId;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupAddress() {
		return supAddress;
	}
	public void setSupAddress(String supAddress) {
		this.supAddress = supAddress;
	}
	public String getSupPhoneNumber() {
		return supPhoneNumber;
	}
	public void setSupPhoneNumber(String supPhoneNumber) {
		this.supPhoneNumber = supPhoneNumber;
	}
	
}
