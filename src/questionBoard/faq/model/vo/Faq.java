package questionBoard.faq.model.vo;

public class Faq {

	private int postNo;
	private String category;
	private String title;
	private String content;
	private char deleted;
	
	public Faq() {}

	public Faq(int postNo, String category, String title, String content, char deleted) {
		this.postNo = postNo;
		this.category = category;
		this.title = title;
		this.content = content;
		this.deleted = deleted;
	}
	
	public Faq(int postNo, String category, String title, String content) {
		super();
		this.postNo = postNo;
		this.category = category;
		this.title = title;
		this.content = content;
	}

	public Faq(int postNo, String category, String title) {
		super();
		this.postNo = postNo;
		this.category = category;
		this.title = title;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
}
