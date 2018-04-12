package school.coder.domain;

public class PageInfo {
	protected int pageIndex;//
	protected int pageSize;//
	protected int pageStart;//
	
	
	public int getPageStart() {
		return pageIndex*pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
