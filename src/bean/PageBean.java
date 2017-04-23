package bean;

import java.util.List;

public class PageBean<E> {

	private List<E> dataList;
	private Integer currPage;
	private Integer pageSize = 20;
	private Integer totalPage;
	private Integer totalCount;

	public List<E> getDataList() {
		return dataList;
	}

	public void setDataList(List<E> dataList) {
		this.dataList = dataList;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
//		return (int) Math.ceil(totalCount * 1.0 / pageSize);
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public PageBean() {
	}

	public PageBean(List<E> dataList, Integer currPage, Integer pageSize,
			Integer totalCount) {
		super();
		this.dataList = dataList;
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
	}

}
