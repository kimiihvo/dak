package study.spring.dak.model;

import lombok.Data;

@Data
public class OneOnOne {
	
	private int oneno;
	private int memno;
	private String regDate;
	private String title;
	private String content;
	private String file;
	private String status;
	private String category;
	
	private String nick;
	private String comRegDate;
	private String comContent;

	
	
	//페이지 구현을 위한 static 변수
		/**LIMIT 절에서 사용할 조회 시작 위치*/
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;
		
		public static int getOffset( ) {
			return offset;
			
		}
		
		public static void setOffset(int offset) {
			OneOnOne.offset = offset;
		}
		
		public static int getListCount() {
			
			return listCount;
		}
		public static void setListCount(int listCount) {
			OneOnOne.listCount = listCount;
		}

}
