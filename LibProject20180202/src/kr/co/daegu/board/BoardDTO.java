package kr.co.daegu.board;

import java.io.Serializable;

public class BoardDTO implements Serializable {

	private int no;
	private String title;
	private String icon;
	private String author;
	private String writedate;
	private String content;
	private int readcount;

	public BoardDTO() {
		super();
	}

	public BoardDTO(int no, String title, String icon, String author, String writedate, String content, int readcount) {
		super();
		this.no = no;
		this.title = title;
		this.icon = icon;
		this.author = author;
		this.writedate = writedate;
		this.content = content;
		this.readcount = readcount;
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

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", icon=" + icon + ", author=" + author + ", writedate="
				+ writedate + ", content=" + content + ", readcount=" + readcount + "]";
	}
}
