package study.spring.dak.model;

import lombok.Data;

@Data
public class Member {
	
	private int memno;
	
	private String memId;
	private String memPw;
	private String memName;
	private String nick;
	private String phone;
	private String email;
	private String birthdate;
	private String gender;
	private String regDate;
	private String isOut;
	private String isAdmin;

	//페이지 구현을 위한 static 변수
		/**LIMIT 절에서 사용할 조회 시작 위치*/
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;
		
		public static int getOffset( ) {
			return offset;
			
		}
		
		public static void setOffset(int offset) {
			Member.offset = offset;
		}
		
		public static int getListCount() {
			
			return listCount;
		}
		public static void setListCount(int listCount) {
			Member.listCount = listCount;
		}

}
