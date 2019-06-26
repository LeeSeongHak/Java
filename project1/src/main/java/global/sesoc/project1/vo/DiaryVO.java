package global.sesoc.project1.vo;

public class DiaryVO {
	
	private int num;
	private String id;
	private String emotion;
	private String weather;
	private String title;
	private String content;
	private String inputdate;
	private String originalfile;
	private String savedfile;
	public DiaryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiaryVO(int num, String id, String emotion, String weather, String title, String content, String inputdate,
			String originalfile, String savedfile) {
		super();
		this.num = num;
		this.id = id;
		this.emotion = emotion;
		this.weather = weather;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmotion() {
		return emotion;
	}
	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getOriginalfile() {
		return originalfile;
	}
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}
	public String getSavedfile() {
		return savedfile;
	}
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}
	@Override
	public String toString() {
		return "DiaryVO [num=" + num + ", id=" + id + ", emotion=" + emotion + ", weather=" + weather + ", title="
				+ title + ", content=" + content + ", inputdate=" + inputdate + ", originalfile=" + originalfile
				+ ", savedfile=" + savedfile + "]";
	}
	
	
}