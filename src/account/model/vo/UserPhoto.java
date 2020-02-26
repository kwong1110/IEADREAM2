package account.model.vo;

public class UserPhoto {
	private int userNo; // 게시물 번호(한 게시물에 사잔이 여러개일 경우 중복 번호가 있을 수 있음)
	private int photoNo; // 사진 번호
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String deleted;
	
	public UserPhoto() {}

	public UserPhoto(int userNo, int photoNo, String originName, String changeName, String filePath, int fileLevel,
			String deleted) {
		super();
		this.userNo = userNo;
		this.photoNo = photoNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.deleted = deleted;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
	
}
