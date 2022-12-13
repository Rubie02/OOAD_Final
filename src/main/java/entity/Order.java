package entity;



public class Order{ //Cart
	private int orderId;
	private Customer cusId;
	private String orderDate;
	private Employee employeeId;
	public Order() {
		super();
	}
	public Order(int orderId, Customer cusId, String orderDate, Employee employeeId) {
		super();
		this.orderId = orderId;
		this.cusId = cusId;
		this.orderDate = orderDate;
		this.employeeId = employeeId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Customer getCusId() {
		return cusId;
	}
	public void setCusId(Customer cusId) {
		this.cusId = cusId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public Employee getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Employee employeeId) {
		this.employeeId = employeeId;
	}
	
	
	
}
