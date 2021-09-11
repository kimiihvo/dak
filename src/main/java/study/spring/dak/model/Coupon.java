package study.spring.dak.model;

import lombok.Data;

@Data
public class Coupon {
	
	private int coupno;
	
	private int memno;
	private String memId;
	
	private String code;
	private String title;
	private String regDate;
	private String expDate;
	private int discount;
	private String isUsed;
	private int orderOver;
	
	
	//페이지 구현을 위한 static 변수
		/**LIMIT 절에서 사용할 조회 시작 위치*/
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;
		
		public static int getOffset( ) {
			return offset;
			
		}
		
		public static void setOffset(int offset) {
			Coupon.offset = offset;
		}
		
		public static int getListCount() {
			
			return listCount;
		}
		public static void setListCount(int listCount) {
			Coupon.listCount = listCount;
		}
	

}
