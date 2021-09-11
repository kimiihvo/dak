package study.spring.dak.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Product;
import study.spring.dak.service.AdminService;


@Slf4j
@RestController
public class AdminRestController {
    /** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.ProfessorService;
    @Autowired  AdminService adminService;
   
    
    
    /** 목록 페이지 */

    @RequestMapping(value = "admin/main_cate", method = RequestMethod.GET)
    public List<Product> main_cate() {
        List<Product> main = null;
      
        try {
            main = adminService.getAdminMainCateList(null);
        } catch (Exception e) {
            log.error("메인 카테고리 서비스 호출에 실패했습니다.");
        }
      return main;
    }
    
    @RequestMapping(value = "admin/sub_cate", method = RequestMethod.GET)
    public List<Product> sub_cate(
    		int param) {
    	
        List<Product> sub = null;
        Product product = new Product();
        product.setMainCateNo(param);
        try {
        	
            sub = adminService.getAdminSubCateList(product);
            
            
        } catch (Exception e) {
            log.error("서브 카테고리 서비스 호출에 실패했습니다.");
        }
      return sub;
    }
}

