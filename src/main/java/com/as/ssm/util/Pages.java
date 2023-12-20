package com.as.ssm.util;

import java.util.List;

/**
 * 分页类
 * @author user
 *
 */
public class Pages<T> {


	/**
	 * 首页
	 */
	private int first;
	
	/**
	 * 前一页
	 */
	private int pre;
	
	/**
	 * 下一页
	 */
	private int next;
	
	/**
	 * 末页
	 */
	private int last;
	
	/**
	 * 当前页
	 */
	private int currPage;
	
	/**
	 * 总记录条数
	 */
	private int rowCount;
	
	/**
	 * 总页数
	 */
	private int total;

	/**
	 * 每页大小
	 */
	private int pageSize;
	
	/**
	 * 查询分页结果
	 */
	private List<T> list;
	
	
	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getPre() {
		return pre;
	}

	public void setPre(int pre) {
		this.pre = pre;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 属性初始化
	 * @param currPage 当前页
	 * @param pageSize 每页大小
	 * @param rowCount 总记录条数
	 * @param list 分页查询结果
	 */
	public void calc(int currPage,int pageSize,int rowCount,List<T> list)
	{
		this.currPage=currPage;
		this.pageSize=pageSize;
		this.rowCount=rowCount;
		this.total=this.rowCount%this.pageSize==0?this.rowCount/this.pageSize:this.rowCount/this.pageSize+1;
		this.first=1;
		this.pre=this.currPage>1?this.currPage-1:1;
		this.next=this.total>this.currPage?this.currPage+1:this.total;
		this.last=this.total;
		this.list=list;	
	}
	
	public Pages(){}
	public Pages(int currPage,int pageSize,int rowCount,List<T> list){
		this.calc(currPage, pageSize, rowCount, list);
	}	
}
