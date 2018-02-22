package kr.co.daegu.boardnotice;

import java.io.Serializable;

public class BoardNoticeDTO implements Serializable {

	private int no;
	private String title;
	private String content;
	private String nal;
	private String author;
	private int readcount;
	private int visible;

	public BoardNoticeDTO() {
		super();
	}

	public BoardNoticeDTO(int no, String title, String content, String nal, String author, int readcount, int visible) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.nal = nal;
		this.author = author;
		this.readcount = readcount;
		this.visible = visible;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getNal() {
		return nal;
	}

	public void setNal(String nal) {
		this.nal = nal;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "BoardNoticeDTO [no=" + no + ", title=" + title + ", content=" + content + ", nal=" + nal + ", author="
				+ author + ", readcount=" + readcount + ", visible=" + visible + "]";
	}

}
