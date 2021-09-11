package study.spring.dak.model;

import lombok.Data;

@Data
public class Review {
	
	private int reviewno;
	
	private int prdno;
	private int memno;
	private String nick;
	private String title;
	
	private int odrno;
	private String content;
	private String regDate;
	private int memRating;
	private String img;
	
	

	
	
	//페이지 구현을 위한 static 변수
			/**LIMIT 절에서 사용할 조회 시작 위치*/
			private static int offset;
			
			/** LIMIT 절에서 사용할 조회할 데이터 수 */
			private static int listCount;
			
			public static int getOffset( ) {
				return offset;
				
			}
			
			public static void setOffset(int offset) {
				Review.offset = offset;
			}
			
			public static int getListCount() {
				
				return listCount;
			}
			
			public static void setListCount(int listCount) {
				Review.listCount = listCount;
			}

}
