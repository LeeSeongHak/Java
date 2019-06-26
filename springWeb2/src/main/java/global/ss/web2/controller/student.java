package global.ss.web2.controller;

public class student {
	private String name;
	private int kor;
	private int eng;
	
	public student(){
		
	}
	public student(String name, int kor, int eng){
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	@Override
	public String toString() {
		return "student [name=" + name + ", kor=" + kor + ", eng=" + eng + "]";
	}
}
