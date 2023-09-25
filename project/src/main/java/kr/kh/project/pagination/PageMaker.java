package kr.kh.project.pagination;

import lombok.Data;

@Data
public class PageMaker {
	    private int totalCount;      
	    private int startPage;       
	    private int endPage;        
	    private boolean prev;        
	    private boolean next;        

	public void setCriteria(Criteria criteria) {
		// TODO Auto-generated method stub
		
	} 
}
