package study.spring.dak.model;

import lombok.Data;

@Data
public class OrderList {
	
	private int odrno;
	
	private int memno;
	private String memName;
	private String phone;
	private String regDate;
	private int toPrice;
	private String status;
	private String pay;

	private int fee;
	private int disAmount;

	private String dlvyName;
	private String dlvyAdr;
	private String dlvyTel;
	
	private Member member;
	//페이지 구현을 위한 static 변수
		/**LIMIT 절에서 사용할 조회 시작 위치*/
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;
		
		public static int getOffset( ) {
			return offset;
			
		}
		
		public static void setOffset(int offset) {
			OrderList.offset = offset;
		}
		
		public static int getListCount() {
			
			return listCount;
		}
		public static void setListCount(int listCount) {
			OrderList.listCount = listCount;
		}
}
