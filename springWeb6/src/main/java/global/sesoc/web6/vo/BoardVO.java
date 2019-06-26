package global.sesoc.web6.vo;

public class BoardVO {
	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	private String originalfile;	//실제 파일이 저장될 때 파일의 이름이 저장
	private String savedfile;		//서버에서 관리 쉽게 바꾼 파일 이름이 저장
	
	public BoardVO(){
		
	}
	
	public BoardVO(
			int boardnum, String id, String title, String content
			, String inputdate, int hits, String originalfile, String savedfile){
		this.boardnum=boardnum;
		this.id=id;
		this.title=title;
		this.content=content;
		this.inputdate=inputdate;
		this.hits=hits;
		this.originalfile=originalfile;
		this.savedfile=savedfile;		
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
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
		return "BoardVO [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", hits=" + hits + ", originalfile=" + originalfile + ", savedfile="
				+ savedfile + "]";
	}
	
	
}
