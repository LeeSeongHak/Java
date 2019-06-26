package global.sesoc.web3.vo;

public class PersonVO {
	private String name;
	private int age;
	private String phone;
	private String address;
	private String textarea;
	
	public PersonVO(){
		
	}
	
	public PersonVO(String name, int age, String phone, String address){
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.address = address;
	}
	
	public PersonVO(String name, int age, String phone, String address, String textarea){
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.textarea = textarea;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTextarea() {
		return textarea;
	}
	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}
	
	@Override
	public String toString() {
		return "PersonVO [name=" + name + ", age=" + age + ", phone=" + phone + ", address=" + address + ", textarea="
				+ textarea + "]";
	}
	
}
