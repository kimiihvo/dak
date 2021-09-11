package study.spring.dak.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.service.OrderService;
import study.spring.dak.service.ProductOrderService;

@Controller
public class OrderListController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    @Autowired	OrderService orderService;    
    
    @Autowired 	ProductOrderService productOrderService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 주문내역페이지 */
    @RequestMapping(value = "/mypage/order_list.do", method = RequestMethod.GET)
    public String orderlist(Model model, HttpSession session,
    		@RequestParam(defaultValue="") String range,
    		@RequestParam(value="before-year", defaultValue = "0") int bYear,
    		@RequestParam(value="before-month", defaultValue = "0") int bMonth,
    		@RequestParam(value="before-date", defaultValue = "0") int bDate,
    		@RequestParam(value="after-year", defaultValue = "0") int aYear,
    		@RequestParam(value="after-month", defaultValue = "0") int aMonth,
    		@RequestParam(value="after-date", defaultValue = "0") int aDate) {
    	
    	Member m = (Member) session.getAttribute("login");
    	
    	List<OrderList> ol = new ArrayList<OrderList>();
    	Map<String, String> mi = new HashMap<String, String>();
    	
    	mi.put("memno", Integer.toString(m.getMemno()));
    	
    	Calendar cal = Calendar.getInstance();
    	String end = String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE)+1);
    	
    	// 만약 duration이 있다면...
    	if (range.equals("1w") || range.equals("")) {
    		
    		cal.add(Calendar.DAY_OF_MONTH, -6);
    		String start = String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));
    		
    		mi.put("start", start);
    		mi.put("end", end);
    		
    		try {
				ol = orderService.getOrderListByDate(mi);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	} else if (range.equals("1m")) {
    		
    		cal.add(Calendar.MONTH, -1);
    		String start = String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));
    		
    		mi.put("start", start);
    		mi.put("end", end);
    		
    		try {
    			ol = orderService.getOrderListByDate(mi);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	} else if (range.equals("3m")) {
    		
    		cal.add(Calendar.MONTH, -3);
    		String start = String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));
    		
    		mi.put("start", start);
    		mi.put("end", end);
    		
    		try {
    			ol = orderService.getOrderListByDate(mi);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	} else if (range.equals("6m")) {
    		
    		cal.add(Calendar.MONTH, -6);
    		String start = String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));
    		
    		mi.put("start", start);
    		mi.put("end", end);
    		
    		try {
    			ol = orderService.getOrderListByDate(mi);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	} else if (range.equals("custom")){
    		if (bYear!=0&&bMonth!=0&&bDate!=0&&aYear!=0&&aMonth!=0&&aDate!=0) {
    			
    			mi.put("start", String.format("%d-%d-%d", bYear, bMonth, bDate));
        		mi.put("end", String.format("%d-%d-%d", aYear, aMonth, aDate+1));
        		
        		try {
        			ol = orderService.getOrderListByDate(mi);
    			} catch (Exception e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		} else {
    			webHelper.redirect(null, "조회기간을 다시 설정해주세요.");
    		}
    	} else {
    		webHelper.redirect(null, "잘못된 접근입니다!");
    	}
    		
    	
    	ProductOrder input = new ProductOrder();
    	
    	for (OrderList temp : ol) {
    		List<ProductOrder> po = new ArrayList<ProductOrder>();
        	
    		input.setOdrno(temp.getOdrno());
    		
        	try {
    			po = productOrderService.getProductOrderList(input);
    			model.addAttribute(Integer.toString(temp.getOdrno()), po);
    		} catch (Exception e) {
    			webHelper.redirect(null, "상세주문 조회에 실패했어요..ㅠ");
    		}
    	}
    	
    	model.addAttribute("ol", ol);
    	
    	return "mypage/order_list";
    }
    
    /** 주문내역 상세 페이지 */
    @RequestMapping(value = "/mypage/order_list_detail.do", method = RequestMethod.GET)
    public String orderlist_detail(Model model, HttpSession session,
    		@RequestParam int odrno) {
    	
    	ProductOrder input = new ProductOrder();
    	input.setOdrno(odrno);
    	
    	OrderList ol = new OrderList();
    	
    	try {
			ol = orderService.getOrderItem(odrno);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	List<ProductOrder> po = new ArrayList<ProductOrder>();
    	
    	try {
			po = productOrderService.getProductOrderList(input);
		} catch (Exception e) {
			webHelper.redirect(null, "상세주문 조회에 실패했어요..ㅠ");
		}
    	
    	model.addAttribute("ol", ol);
    	model.addAttribute("po", po);
    	
    	return "mypage/order_list_detail";
    }
    
    /** 주문 삭제처리 페이지 */
    @RequestMapping(value = "/mypage/order_delete_ok.do", method = RequestMethod.GET)
    public ModelAndView deleteOk(@RequestParam int odrno) {
    	
    	OrderList input = new OrderList();
    	input.setOdrno(odrno);
    	
    	try {
    		orderService.cancelOrder(input);
    	} catch (Exception e) {
    		return webHelper.redirect(null, "주문 취소에 실패하였습니다.");
    	}
    	
    	return webHelper.redirect(contextPath + "/mypage/order_list.do", "주문 취소에 성공하였습니다.");
    }
    
}
