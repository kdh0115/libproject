package kr.co.daegu.boardQA;

import java.io.Serializable;

public class BoardQADTO implements Serializable {
	
	private int no;
	private String title;
	private String content;
	private String nal;
	private String author;
	private int readcount;
	private int visible;

	public BoardQADTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardQADTO(int no, String title, String content, String nal, String author, int readcount, int visible) {
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
		return "BoardQADTO [no=" + no + ", title=" + title + ", content=" + content + ", nal=" + nal + ", author="
				+ author + ", readcount=" + readcount + ", visible=" + visible + "]";
	}

}
