package com.zlwh.hands.api.domain.base;

public class PageDomain {
	
	private String pageNo;
	private String pageSize = "15";
	private long pageTime; // 上次刷新时间，分页查询时，防止分页数据错乱

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public long getPageTime() {
		return pageTime;
	}

	public void setPageTime(long pageTime) {
		this.pageTime = pageTime;
	}
}
