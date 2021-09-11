package study.spring.dak.model;



import lombok.Data;

@Data
public class Product {
	
	private int prdno;
	
	private String title;
	private int price; 
	private int rating; 
	private String express;
	private String thumb;
	private String mainImg;
	private String detailImg;
	private int weight;
	private String freeShipping;
	private String onSale;
	private String regDate;
	private int sv;
	private int rct;
	
	private int mainCateNo;
	private int subCateNo;
	private String mainCateName;
	private String subCateName;
	
	
	
	//페이지 구현을 위한 static 변수
	/**LIMIT 절에서 사용할 조회 시작 위치*/
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;
	
	public static int getOffset( ) {
		return offset;
		
	}
	
	public static void setOffset(int offset) {
		Product.offset = offset;
	}
	
	public static int getListCount() {
		
		return listCount;
	}
	public static void setListCount(int listCount) {
		Product.listCount = listCount;
	}
}


