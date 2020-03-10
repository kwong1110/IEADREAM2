package account.model.vo;

public class UserPhoto {
	private int photoNo;
	private int userNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String deleted;
	
	public UserPhoto() {}

	public UserPhoto(int photoNo, int userNo, String originName, String changeName, String filePath, int fileLevel,
			String deleted) {
		super();
		this.photoNo = photoNo;
		this.userNo = userNo;
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

	@Override
	public String toString() {
		return "UserPhoto [userNo=" + userNo + ", photoNo=" + photoNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", deleted=" + deleted + "]";
	}
	
	
}
