package kr.co.daegu.boardQA;

import java.io.Serializable;
import java.util.ArrayList;

public class PageToQA implements Serializable {

	private ArrayList<BoardQADTO> list; //목록리스트저장
    private int curPage;//현재 페이지 번호
    private int perPage;//페이지당 보여줄 레코드 개수
    private int totalCount;//전체레코드개수
    
 public PageToQA() {

  this.perPage = 5;
 }
 
 public ArrayList<BoardQADTO> getList() {
  return list;
 }
 public void setList(ArrayList<BoardQADTO> list) {
  this.list = list;
 }
 public int getCurPage() {
  return curPage;
 }
 public void setCurPage(int curPage) {
  this.curPage = curPage;
 }
 public int getPerPage() {
  return perPage;
 }
 public void setPerPage(int perPage) {
  this.perPage = perPage;
 }
 public int getTotalCount() {
  return totalCount;
 }
 public void setTotalCount(int totalCount) {
  this.totalCount = totalCount;
 }
 @Override
 public String toString() {
  return "PageTo [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
    + "]";
 }    
}
