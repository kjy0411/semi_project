package kr.kh.project.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page;        
    private int perPageNum;
	public void setAmount(int i) {
		// TODO Auto-generated method stub
		
	}
	public void calculateStartEnd() {
		// TODO Auto-generated method stub
		
	}
	 public int getStart() {
	        return (page - 1) * perPageNum;
	    }
}
