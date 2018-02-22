package kr.co.daegu.member;

import java.io.Serializable;

public class MemberDTO implements Serializable {
	
	private String id;// 아이디
	private String pw;// 비밀번호
	private String pwch;// 비밀번호확인
	private String irum;// 이름
	private String tel;// 전화번호
	private String email;// 이메일
	private String birth;// 생년월일
	private String memImage;// 프로필
	private String emailcheck;// 이메일수신여부
	private String smscheck;// 문자수신여부
	private int visible;// 회원존재여부 Default=1

	public MemberDTO() {
		super();
	}

	public MemberDTO(String id, String pw, String pwch, String irum, String tel, String email, String birth,
			String memImage, String emailcheck, String smscheck, int visible) {
		super();
		this.id = id;
		this.pw = pw;
		this.pwch = pwch;
		this.irum = irum;
		this.tel = tel;
		this.email = email;
		this.birth = birth;
		this.memImage = memImage;
		this.emailcheck = emailcheck;
		this.smscheck = smscheck;
		this.visible = visible;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPwch() {
		return pwch;
	}

	public void setPwch(String pwch) {
		this.pwch = pwch;
	}

	public String getIrum() {
		return irum;
	}

	public void setIrum(String irum) {
		this.irum = irum;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMemImage() {
		return memImage;
	}

	public void setMemImage(String memImage) {
		this.memImage = memImage;
	}

	public String getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}

	public String getSmscheck() {
		return smscheck;
	}

	public void setSmscheck(String smscheck) {
		this.smscheck = smscheck;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", pwch=" + pwch + ", irum=" + irum + ", tel=" + tel + ", email="
				+ email + ", birth=" + birth + ", memImage=" + memImage + ", emailcheck=" + emailcheck + ", smscheck="
				+ smscheck + ", visible=" + visible + "]";
	}

}
