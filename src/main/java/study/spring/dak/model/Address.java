package study.spring.dak.model;

import lombok.Data;

@Data
public class Address {
	
	// pk
	private int adrno;
	
	private String toName;
	private String phone;
	private String zcode;
	private String adr1;
	private String adr2;
	private String isDefault;
	private String express;
	
	
	private int memno;

}
