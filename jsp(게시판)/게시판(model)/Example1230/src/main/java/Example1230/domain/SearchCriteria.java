package Example1230.domain;

public class SearchCriteria extends Criteria{
	private String searchOption;
	private String searchContext;
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchContext() {
		return searchContext;
	}
	public void setSearchContext(String searchContext) {
		this.searchContext = searchContext;
	}
}
