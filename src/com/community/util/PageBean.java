package com.community.util;

import java.util.List;

import com.community.bean.News;


/**
 * ��ҳԪ����
 * @author zym
 *
 * 2018��12��24��
 */
public class PageBean {
	private List data;//��ҳ����
	private int currentPage;//��ǰҳ
	private int firstPage;//��ҳ
	private int prePage;//��һҳ
	private int nextPage;//��һҳ
	private int totalPage;//ĩҳ/��ҳ��
	private int totalCount;//�ܼ�¼��
	private int pageSize;//ÿҳ��¼��
	public List getData() {
		return data;
	}
	public void setData(List<News> data) {
		this.data = data;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	
//	��һҳ  �㷨������ǰҳ������ҳ����һҳ���ڵ�ǰҳ��������һҳ���ڵ�ǰҳ-1
	public int getPrePage() {
		return this.getCurrentPage()==this.getFirstPage()?this.getCurrentPage():this.getCurrentPage()-1;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	
//	��һҳ  �㷨������ǰҳ������ҳ������һҳ���ڵ�ǰҳ��������һҳ���ڵ�ǰҳ+1
	public int getNextPage() {
		return this.getCurrentPage()==this.getTotalPage()?this.getCurrentPage():this.getCurrentPage()+1;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
//	��ҳ��  �㷨�����ܼ�¼����������ÿҳ��¼����ҳ��=�ܼ�¼��/ÿҳ��¼����������ҳ��=�ܼ�¼��/ÿҳ��¼��+1
	public int getTotalPage() {
		return this.getTotalCount()%this.getPageSize()==0?this.getTotalCount()/this.getPageSize():this.getTotalCount()/this.getPageSize()+1;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
