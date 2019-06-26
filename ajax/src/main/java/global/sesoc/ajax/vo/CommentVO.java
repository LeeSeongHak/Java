package global.sesoc.ajax.vo;

public class CommentVO {
	private int num;
	private String name;
	private String text;
	
	public CommentVO(){
		
	}
	
	public CommentVO(int num, String text){
		this.num = num;
		this.text = text;
	}
	
	public CommentVO(int num, String name, String text){
		this.num = num;
		this.name = name;
		this.text = text;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "CommentVO [name=" + name + ", text=" + text + "]";
	}
	
}
