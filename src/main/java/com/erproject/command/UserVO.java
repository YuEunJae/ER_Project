package com.erproject.command;

import java.util.ArrayList;

public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userEmail;
	/*2개로 받기 */
	private String userEmail1;
	private String userEmail2;
	
	private String addrAll;
	
	/*3개를 addrAll로 받기 */
	private String addrZipNum;
	private String addrBasic;
	private String addrDetail;

	/*보드*/
	private ArrayList<QnaVO> qnaList;
	private ArrayList<ProductReviewVO> proReList;

	public ArrayList<ProductReviewVO> getProReList() {
		return proReList;
	}

	public void setProReList(ArrayList<ProductReviewVO> proReList) {
		this.proReList = proReList;
	}
	


	public UserVO() {
		
	}

	public UserVO(String userId, String userPw, String userName, String userPhone, String userEmail, String userEmail1,
			String userEmail2, String addrAll, String addrZipNum, String addrBasic, String addrDetail) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userEmail1 = userEmail1;
		this.userEmail2 = userEmail2;
		this.addrAll = addrAll;
		this.addrZipNum = addrZipNum;
		this.addrBasic = addrBasic;
		this.addrDetail = addrDetail;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userEmail1=" + userEmail1 + ", userEmail2=" + userEmail2
				+ ", addrAll=" + addrAll + ", addrZipNum=" + addrZipNum + ", addrBasic=" + addrBasic + ", addrDetail="
				+ addrDetail + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmail1() {
		return userEmail1;
	}

	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}

	public String getUserEmail2() {
		return userEmail2;
	}

	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}

	public String getAddrAll() {
		return addrAll;
	}

	public void setAddrAll(String addrAll) {
		this.addrAll = addrAll;
	}

	public String getAddrZipNum() {
		return addrZipNum;
	}

	public void setAddrZipNum(String addrZipNum) {
		this.addrZipNum = addrZipNum;
	}

	public String getAddrBasic() {
		return addrBasic;
	}

	public void setAddrBasic(String addrBasic) {
		this.addrBasic = addrBasic;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}


	public ArrayList<QnaVO> getQnaList() {
		return qnaList;
	}

	public void setQnaList(ArrayList<QnaVO> qnaList) {
		this.qnaList = qnaList;
	}


	
	

	
	
	

}