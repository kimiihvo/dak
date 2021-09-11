package study.spring.dak.model;

import lombok.Data;

@Data
public class OutMember {
	
	private int outno;
	
	private String memId;
	private String memName;
	private String phone;
	private String email;
	private String outDate;
	private String outWhy;

}
