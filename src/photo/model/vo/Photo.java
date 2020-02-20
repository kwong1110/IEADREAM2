package photo.model.vo;

public class Photo {
	
	private int photoNo;
	private int boardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private char deleted;
	
	public Photo() {}

	public Photo(int photoNo, int boardNo, String originName, String changeName, String filePath, int fileLevel,
			char deleted) {
		this.photoNo = photoNo;
		this.boardNo = boardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.deleted = deleted;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
}
