package study.spring.dak.controllers;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.model.Review;
import study.spring.dak.model.UploadItem;
import study.spring.dak.service.AdminService;

@Slf4j
@Controller
public class AdminController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    
    @Autowired AdminService adminService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    

    @RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
    public ModelAndView login(Model model ) {            

        return new ModelAndView("admin/login");
    }
    
    @RequestMapping(value = "/admin/login_ok.do", method = RequestMethod.POST)
    public ModelAndView login_ok(Model model,
            // 로그인정보
            @RequestParam(value="memId", required=true  ) String memId, 
    		@RequestParam(value="memPw", required=true ) String memPw,            
    		HttpServletRequest request ) {
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Member input = new Member();
        input.setMemId(memId);
        input.setMemPw(memPw);
        HttpSession session = request.getSession();
       
        Member admin = new Member();
        
        
        try {
        	
         admin = adminService.getAdminLogin(input);
         if(admin==null) {
        	 return webHelper.redirect("login.do", "권한이 없습니다.");
         }else {
        	 session.setAttribute("admin",admin);
         }
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        return webHelper.redirect("product_list.do", "관리자로 로그인하였습니다.");
        
    }
    
    
    
    

    @RequestMapping(value = "/admin/product_list.do", method = RequestMethod.GET)
    public ModelAndView listProduct(Model model, HttpSession session,
    		//검색어
			@RequestParam(value="keyword",required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page",defaultValue="1") int nowPage)  {
    		
    		Member admin =(Member) session.getAttribute("admin");
    		if(admin==null) {
    			return webHelper.redirect("login.do", "로그인이 필요합니다.");
    		}
    		
	    	
			int totalCount =0; //전체 게시글 수
			int listCount = 5; // 한 페이지당 표시할 목록 수
			int pageCount =5; // 한 그룹당 표시할 페이지 번호 수
			
			
			Product input = new Product(); // 조건 담을 객체 
			List<Product> output = null ; //  조회결과가 저장될 객체
			
			input.setTitle(keyword);
			
			
			PageData pageData = null;
			try {
			totalCount = adminService.getAdminProductCount(input);
			pageData = new PageData(nowPage, totalCount,listCount,pageCount);
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			output = adminService.getAdminProductList(input);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("output",output);
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
	        return new ModelAndView("admin/product_list");
    }
    
    
    @RequestMapping(value="/admin/product_reg.do", method = RequestMethod.GET)
	public ModelAndView product_reg(Model model,HttpSession session) {
    	
    	Member admin =(Member) session.getAttribute("admin");
		if(admin==null) {
			return webHelper.redirect("login.do", "로그인이 필요합니다.");
		}
	
    	
		return new ModelAndView("admin/product_reg");
    }
	
    

	@RequestMapping(value="/admin/product_reg_ok.do", method = RequestMethod.POST)
	public ModelAndView product_reg_ok(Model model,
			String title,
			String price,
			int deli,
			String weight,
			int sub,
			@RequestParam(required=true) MultipartFile detailImg,
			@RequestParam(required=true) MultipartFile mainImg,HttpSession session) {
		
		Member admin =(Member) session.getAttribute("admin");
		if(admin==null) {
			return webHelper.redirect("login.do", "로그인이 필요합니다.");
		}
		
		/**  사용자가 입력한 파라미터 유효성 검사 */
		if(!regexHelper.isNum(price)) {return webHelper.redirect(null, "가격은 숫자만 가능합니다.");}
		if(!regexHelper.isNum(weight)) {return webHelper.redirect(null, "중량은 숫자만 가능합니다.");}
		if(Integer.parseInt(price)<0) {return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");};
		if(Integer.parseInt(price)==0) {return webHelper.redirect(null, "가격을 입력하세요");};
		if(Integer.parseInt(weight)<0) {return webHelper.redirect(null, "중량은 0보다 적을 수 없습니다.");};
		if(Integer.parseInt(weight)==0) {return webHelper.redirect(null, "중량을 입력하세요");};
		
		
	     /**  업로드 처리 */
        // 업로드 결과가 저장된 Beans를 리턴받는다.
        UploadItem itemd = null;
        UploadItem itemm = null;
        try {
        	itemd = webHelper.saveMultipartFile(detailImg);
        	itemm = webHelper.saveMultipartFile(mainImg);
        } catch (NullPointerException e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드에 실패했습니다.");
        }
        /** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
        if (itemm != null && itemm.getContentType().indexOf("image") > -1) {
            // 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
            String thumbnailPath = null;
            
            try {
                thumbnailPath = webHelper.createThumbnail(itemm.getFilePath(), 240, 240, true);
            } catch (Exception e) {
                e.printStackTrace();
                return webHelper.redirect(null, "썸네일 이미지 생성에 실패했습니다.");
            }
            
            // 썸네일 경로를 URL로 변환
            String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
            // 리턴할 객체에 썸네일 정보 추가
            itemm.setThumbnailPath(thumbnailPath);
            itemm.setThumbnailUrl(thumbnailUrl);
        }
        
        
        Product input = new Product();
        
        input.setSubCateNo(sub);
        input.setTitle(title);
        input.setPrice(Integer.parseInt(price));
        input.setWeight(Integer.parseInt(weight));
        input.setMainImg(itemm.getFileUrl());
		input.setDetailImg(itemd.getFileUrl());
		input.setThumb(itemm.getThumbnailUrl());
		if(deli == 1) {
			input.setExpress("Y");
			input.setFreeShipping("N");
			input.setOnSale("Y");
		}else if (deli == 2) {
			input.setExpress("N");
			input.setFreeShipping("Y");
			input.setOnSale("Y");
		}else {
			input.setExpress("N");
			input.setFreeShipping("N");
			input.setOnSale("Y");
		}
		/**  view 처리 */
		try {
			adminService.addAdminProduct(input);
			
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		
		}
		String redirectUrl = contextPath+"/admin/product_edit.do?prdno="+input.getPrdno();
		return webHelper.redirect(redirectUrl, "저장 되었습니다."); 
	
	}
	
	@RequestMapping(value = "/admin/product_edit.do", method = RequestMethod.GET)
    public ModelAndView product_edit(Model model,
            @RequestParam(value="prdno") int prdno,HttpSession session ) {
		
		
		Member admin =(Member) session.getAttribute("admin");
		if(admin==null) {
			return webHelper.redirect("login.do", "로그인이 필요합니다.");
		}
		
        Product input = new Product();
        input.setPrdno(prdno);
        Product output = null;
        
        try {
            output = adminService.getAdminProductItem(input);
           
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        	
        	
        /** 3) View 처리 */
        model.addAttribute("output", output);
        
        return new ModelAndView("admin/product_edit");
    }
    
	
  @RequestMapping(value = "/admin/product_edit_ok.do", method = RequestMethod.POST)
    public ModelAndView product_edit_ok(Model model, HttpSession session,
    		@RequestParam(value="prdno" ,required=true) int prdno,
    		@RequestParam(value="title" ,required=true) String title,
    		@RequestParam(value="price" ,required=true) String price,
    		@RequestParam(value="deli") int deli,
    		@RequestParam(value="weight" ,required=true) String weight,
    		@RequestParam(value="sub") int sub,
			@RequestParam(required=false) MultipartFile detailImg,
			@RequestParam(required=false) MultipartFile mainImg) {
	  
	  
	  Member admin =(Member) session.getAttribute("admin");
		if(admin==null) {
			return webHelper.redirect("login.do", "로그인이 필요합니다.");
		}
		/**  사용자가 입력한 파라미터 유효성 검사 */
		if(!regexHelper.isNum(price)) {return webHelper.redirect(null, "가격은 숫자만 가능합니다.");}
		if(!regexHelper.isNum(weight)) {return webHelper.redirect(null, "중량은 숫자만 가능합니다.");}
		if(Integer.parseInt(price)<0) {return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");};
		if(Integer.parseInt(price)==0) {return webHelper.redirect(null, "가격을 입력하세요");};
		if(Integer.parseInt(weight)<0) {return webHelper.redirect(null, "중량은 0보다 적을 수 없습니다.");};
		if(Integer.parseInt(weight)==0) {return webHelper.redirect(null, "중량을 입력하세요");};
	   

		Product input = new Product();
		
		input.setPrdno(prdno);
		
		  try {
	            input = adminService.getAdminProductItem(input);
	           
	        } catch (Exception e) {
	            return webHelper.redirect(null, e.getLocalizedMessage());
	        }

		
			if(deli == 1) {
				input.setExpress("Y");
				input.setFreeShipping("N");
			}else if (deli == 2) {
				input.setExpress("N");
				input.setFreeShipping("Y");
			}else if (deli == 3) {
				input.setExpress("N");
				input.setFreeShipping("N");
			}
			
        input.setSubCateNo(sub);
        input.setTitle(title);
        input.setPrice(Integer.parseInt(price));
        input.setWeight(Integer.parseInt(weight));
        
        
        
		/**  업로드 처리 */
       // 업로드 결과가 저장된 Beans를 리턴받는다.
       UploadItem itemd = null;
       UploadItem itemm = null;
       
       if(!detailImg.isEmpty()) { 
    	   try {
          	itemd = webHelper.saveMultipartFile(detailImg);
           } catch (NullPointerException e) {
               e.printStackTrace();
               return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
           } catch (Exception e) {
               e.printStackTrace();
               return webHelper.redirect(null, "업로드에 실패했습니다.");
           }
    	   input.setDetailImg(itemd.getFileUrl());
   		
       }
       if(!mainImg.isEmpty()) {
    	   try {
    	       	itemm = webHelper.saveMultipartFile(mainImg);
    	       } catch (NullPointerException e) {
    	           e.printStackTrace();
    	           return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
    	       } catch (Exception e) {
    	           e.printStackTrace();
    	           return webHelper.redirect(null, "업로드에 실패했습니다.");
    	       }
    	   		/** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
           if (itemm != null && itemm.getContentType().indexOf("image") > -1) {
               // 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
               String thumbnailPath = null;
               
               try {
                   thumbnailPath = webHelper.createThumbnail(itemm.getFilePath(), 240, 240, true);
               } catch (Exception e) {
                   e.printStackTrace();
                   return webHelper.redirect(null, "썸네일 이미지 생성에 실패했습니다.");
               }
               
               // 썸네일 경로를 URL로 변환
               String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
               // 리턴할 객체에 썸네일 정보 추가
               itemm.setThumbnailPath(thumbnailPath);
               itemm.setThumbnailUrl(thumbnailUrl);
           }
           input.setMainImg(itemm.getFileUrl());
           input.setThumb(itemm.getThumbnailUrl());
       }
       
        try {
            // 데이터 수정
            adminService.editAdminProduct(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다. 
        String redirectUrl = contextPath + "/admin/product_edit.do?prdno=" + input.getPrdno();
        return webHelper.redirect(redirectUrl, "수정되었습니다.");
    }
  
  
	  @RequestMapping(value = "/admin/product_delete_ok.do", method = RequestMethod.GET)
	  public ModelAndView delete_ok(Model model,HttpSession session,
	          @RequestParam(value="prdno", required=true) int prdno) {
		  
		  Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}

	  Product input = new Product();
      input.setPrdno(prdno);
      input.setOnSale("N");

      try {
          adminService.deleteAdminProduct(input); 
      } catch (Exception e) {
          return webHelper.redirect(null, e.getLocalizedMessage());
      }

 
      return webHelper.redirect(contextPath + "/admin/product_list.do", "삭제되었습니다.");
  }
	
		
		
		
		/** -----------------주문결제 관리자 게시판---------------- */
		
		
		@RequestMapping(value = "/admin/order_list.do", method = RequestMethod.GET)
	    public ModelAndView order_list(Model model,HttpSession session,
	    		//검색어
				@RequestParam(value="keyword",required=false ) String keyword,
				// 페이지 구현에서 사용할 현재 페이지 번호
				@RequestParam(value="page",defaultValue="1") int nowPage) {
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			int totalCount = 0; //전체 게시글 수
			int listCount = 5; // 한 페이지당 표시할 목록 수
			int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

			OrderList input = new OrderList(); // 조건 담을 객체 
			input.setMemName(keyword);
			List<OrderList> output = null ; //  조회결과가 저장될 객체
			
			
			
			PageData pageData = null;
			try {
				
			totalCount = adminService.getAdminOrderListCount(input);
			pageData = new PageData(nowPage, totalCount,listCount,pageCount);
			
			OrderList.setOffset(pageData.getOffset());
			OrderList.setListCount(pageData.getListCount());
			output = adminService.getAdminOrderListList(input);
			
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("output",output);
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);

	        return new ModelAndView("admin/order_list");
	    }
		
		
		
		@RequestMapping(value = "/admin/order_view.do", method = RequestMethod.GET)
	    public ModelAndView order_view(Model model,HttpSession session,
	    		int odrno) {     
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			OrderList input = new OrderList();
			input.setOdrno(odrno);
			ProductOrder input2 = new ProductOrder();
			input2.setOdrno(odrno);
			
			
			
			OrderList output = null;
			List<ProductOrder> output2 = null;
				try {
					
					output = adminService.getAdminOrderListItem(input);
					output2 = adminService.getAdminProductOrderList(input2);
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
				
		     model.addAttribute("output2",output2);	
			 model.addAttribute("output",output);
			 return new ModelAndView("admin/order_view");
			
	    }
		
		@RequestMapping(value = "/admin/order_view_ok.do", method = RequestMethod.POST)
	    public ModelAndView order_view_ok(Model model,HttpSession session,
	    		OrderList input) { 
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			try {
					adminService.editAdminOrderList(input);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			 String redirectUrl = contextPath + "/admin/order_view.do?odrno=" + input.getOdrno();
		     return webHelper.redirect(redirectUrl, "수정완료~.");
			
	    }
		
		
		
		
		
		
		/** -----------------Member 관리자 게시판---------------- */
		
		
		@RequestMapping(value = "/admin/member_list.do", method = RequestMethod.GET)
	    public ModelAndView member_list(Model model,HttpSession session,
	    		//검색어
				@RequestParam(value="keyword",required=false) String keyword,
				// 페이지 구현에서 사용할 현재 페이지 번호
				@RequestParam(value="page",defaultValue="1") int nowPage) {
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			int totalCount = 0; //전체 게시글 수
			int listCount = 7; // 한 페이지당 표시할 목록 수
			int pageCount =5; // 한 그룹당 표시할 페이지 번호 수

			Member input = new Member(); // 조건 담을 객체 
			List<Member> output = null ; //  조회결과가 저장될 객체
			
			input.setNick(keyword);
			
			
			PageData pageData = null;
			try {
				
			totalCount = adminService.getAdminMemberCount(input);
			pageData = new PageData(nowPage, totalCount,listCount,pageCount);
			
			Member.setOffset(pageData.getOffset());
			Member.setListCount(pageData.getListCount());
			output = adminService.getAdminMemberList(input);
			
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("output",output);
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);

	        return new ModelAndView("admin/member_list");
	    
		}
		
		
		
		@RequestMapping(value = "/admin/member_view.do", method = RequestMethod.GET)
	    public ModelAndView member_view(Model model,HttpSession session,
	    		int memno) {      
			
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			
			Member input = new Member();	
			Member output = new Member();
			input.setMemno(memno);
			
		
				try {
					
					output = adminService.getAdminMemberItem(input);
					
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
				
			 model.addAttribute("output",output);
			 return new ModelAndView("admin/member_view");
			
	    }
		
		@RequestMapping(value = "/admin/member_view_ok.do", method = RequestMethod.POST)
	    public ModelAndView member_view_ok(Model model,HttpSession session,
	    		Member member) { 
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			try {
					adminService.editAdminMember(member);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			 String redirectUrl = contextPath + "/admin/member_view.do?memno=" + member.getMemno();
		     return webHelper.redirect(redirectUrl, "수정완료~.");
			
	    }

		
		/** --------------------1:1문의 컨트롤러 --------------*/
		@RequestMapping(value = "/admin/oneonone_list.do", method = RequestMethod.GET)
	    public ModelAndView oneonone_list(Model model,HttpSession session,
	    		//검색어
				@RequestParam(value="keyword", defaultValue="") String keyword,
				// 페이지 구현에서 사용할 현재 페이지 번호
				@RequestParam(value="page",defaultValue="1") int nowPage,
				@RequestParam(value="status", defaultValue="" ) String status) {
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			int totalCount = 0; //전체 게시글 수
			int listCount = 5; // 한 페이지당 표시할 목록 수
			int pageCount =5; // 한 그룹당 표시할 페이지 번호 수

			OneOnOne input = new OneOnOne(); // 조건 담을 객체 
			List<OneOnOne> output = null ; //  조회결과가 저장될 객체
			
			input.setNick(keyword);
			
			if(status.equals("") || status.equals("전체")) {
				input.setStatus(null);
			}else {
				input.setStatus(status);
			}
			PageData pageData = null;
			try {
				
			totalCount = adminService.getAdminOneOnOneCount(input);
			pageData = new PageData(nowPage, totalCount,listCount,pageCount);
			OneOnOne.setOffset(pageData.getOffset());
			OneOnOne.setListCount(pageData.getListCount());
			output = adminService.getAdminOneOnOneList(input);
			
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("output",output);
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);
			model.addAttribute("status",status);
			

	        return new ModelAndView("admin/oneonone_list");
	    }
		
		
		
		
		@RequestMapping(value = "/admin/oneonone_view.do", method = RequestMethod.GET)
	    public ModelAndView oneonone_view(Model model,HttpSession session,
	    		int oneno) {         
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			OneOnOne input = new OneOnOne();	
			OneOnOne output = new OneOnOne();
			input.setOneno(oneno);
			
			
		
				try {
					
					output = adminService.getAdminOneOnOneItem(input);
					
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
				
			 model.addAttribute("output",output);
			 return new ModelAndView("admin/oneonone_view");
			
	    }
		
		@RequestMapping(value = "/admin/oneonone_view_ok.do", method = RequestMethod.POST)
	    public ModelAndView oneonone_view_ok(Model model,HttpSession session,
	    		int oneno,
	    		String comContent,
	    		String comRegDate) { 
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			OneOnOne input = new OneOnOne();
			input.setComContent(comContent);
			input.setOneno(oneno);
			
			if(comRegDate.equals("") || comRegDate.equals("null")) {
				try {
					input.setStatus("답변완료");
					adminService.addAdminOneOnOne(input); 
					
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
				
				 
				 String redirectUrl = contextPath + "/admin/oneonone_view.do?oneno=" + input.getOneno();
			     return webHelper.redirect(redirectUrl, "저장되었습니다.");
			 }
			
			try {
					adminService.editAdminOneOnOne(input);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			 String redirectUrl = contextPath + "/admin/oneonone_view.do?oneno=" + input.getOneno();
		     return webHelper.redirect(redirectUrl, "수정완료~.");
			
	    }
		
		
		@RequestMapping(value = "/admin/oneonone_delete_ok.do", method = RequestMethod.GET)
	    public ModelAndView oneonone_delete_ok(Model model,HttpSession session,
	    		int oneno) { 
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			OneOnOne input = new OneOnOne();
			input.setOneno(oneno);
			
			
			try {
				adminService.deleteAdminOneOnOne(input);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			  return webHelper.redirect(contextPath + "/admin/oneonone_list.do", "삭제되었습니다.");
			
	    }
		
		
		/** -----------------review 관리자 게시판---------------- */
		
		
		@RequestMapping(value = "/admin/review_list.do", method = RequestMethod.GET)
	    public ModelAndView review_list(Model model,HttpSession session,
	    		//검색어
				@RequestParam(value="keyword",required=false) String keyword,
				// 페이지 구현에서 사용할 현재 페이지 번호
				@RequestParam(value="page",defaultValue="1") int nowPage) {
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			
			int totalCount = 0; //전체 게시글 수
			int listCount = 5; // 한 페이지당 표시할 목록 수
			int pageCount =5; // 한 그룹당 표시할 페이지 번호 수

			Review input = new Review(); // 조건 담을 객체 
			List<Review> output = null ; //  조회결과가 저장될 객체
			input.setNick(keyword);
			
			
			
			PageData pageData = null;
			try {
				
			totalCount = adminService.getAdminReviewCount(input);
			pageData = new PageData(nowPage, totalCount,listCount,pageCount);
			
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());
			output = adminService.getAdminReviewList(input);
			
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			model.addAttribute("output",output);
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageData",pageData);

	        return new ModelAndView("admin/review_list");
	    }
		
		@RequestMapping(value = "/admin/review_view.do", method = RequestMethod.GET)
	    public ModelAndView review_view(Model model,HttpSession session,
	    		int reviewno) {  
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			Review input = new Review();	
			Review output = new Review();
			input.setReviewno(reviewno);
			
		
				try {
					
					output = adminService.getAdminReviewItem(input);
					
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}
				
			 model.addAttribute("output",output);
			 return new ModelAndView("admin/review_view");
			
	    }
		
		
		@RequestMapping(value = "/admin/review_delete_ok.do", method = RequestMethod.GET)
	    public ModelAndView review_delete_ok(Model model,
	    		HttpSession session,
	    		int reviewno) { 
			
			Member admin =(Member) session.getAttribute("admin");
			if(admin==null) {
				return webHelper.redirect("login.do", "로그인이 필요합니다.");
			}
			Review input = new Review();
			input.setReviewno(reviewno);
			Product product= new Product();

			try {
				input=adminService.getAdminReviewItem(input);
				product.setPrdno(input.getPrdno());
				product=adminService.getAdminProductItem(product);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			product.setRating(product.getRating()-input.getMemRating());
			product.setRct(product.getRct()-1);
			try {
				adminService.editAdminProduct(product);
				adminService.deleteAdminReview(input);
				
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			
			  return webHelper.redirect(contextPath + "/admin/review_list.do", "삭제되었습니다.");
			
	    }
		
		
		

		
		
		
		
		
		
		
		
		
}
