package study.spring.dak.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.model.Review;
import study.spring.dak.service.AdminService;



@Service
@Slf4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	@Override
	public Member getAdminLogin(Member input) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("AdminMemberMapper.loginCheck",input);
			
			if(!result.getIsAdmin().equals("Y")) {
				result= null;
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디 또는 비밀번호가 틀렸습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Product> getAdminProductList(Product input) throws Exception {
		List<Product> result = null;
		
		
		try {
			result = sqlSession.selectList("AdminProductMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		return result;
		
}
	


	@Override
	public List<Product> getAdminMainCateList(Product input) throws Exception {
		List<Product> result = null;
		try {
			result = sqlSession.selectList("AdminProductMapper.selectMainCateList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public List<Product> getAdminSubCateList(Product input) throws Exception {
		List<Product> result = null;
		try {
			result = sqlSession.selectList("AdminProductMapper.selectSubCateList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getAdminProductCount(Product input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("AdminProductMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}
	 
	@Override
	public Product getAdminProductItem(Product input) throws Exception {

		Product result = null;
		try {
			result = sqlSession.selectOne("AdminProductMapper.selectItem",input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	
	 /**                        */
	
	

	@Override
	public int addAdminProduct(Product input) throws Exception {
		int result =0;
		try {
			result= sqlSession.insert("AdminProductMapper.insertItem",input);
			
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
			
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}

	@Override
	public int editAdminProduct(Product input) throws Exception {
		  int result = 0;

	        try {
	            result = sqlSession.update("AdminProductMapper.updateItem", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        }

	        return result;
	}

	@Override
	public int deleteAdminProduct(Product input) throws Exception {
		 int result = 0;

	        try {
	            
	            result = sqlSession.delete("AdminProductMapper.updateItem2", input);

	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("삭제된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 삭제에 실패했습니다.");
	        }

	        return result;
	}
	



	
	/**-------------------------------1:1문의 게시판 --------------------*/

	@Override
	public List<OneOnOne> getAdminOneOnOneList(OneOnOne input) throws Exception {
			List<OneOnOne> result = null;
		
		
		try {
			result = sqlSession.selectList("AdminOneOnOneMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public int getAdminOneOnOneCount(OneOnOne input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("AdminOneOnOneMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수 조회에 실패했습니다.");}
		return result;
	}

	@Override
	public OneOnOne getAdminOneOnOneItem(OneOnOne input) throws Exception {

		OneOnOne result = null;
		try {
			result = sqlSession.selectOne("AdminOneOnOneMapper.selectItem",input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터조회에 실패했습니다.");
		}
		
		return result;
	}



	@Override
	public int addAdminOneOnOne(OneOnOne input) throws Exception {
		int result =0;
		try {
			result= sqlSession.insert("AdminOneOnOneMapper.insertItem",input);
					sqlSession.update("AdminOneOnOneMapper.updateItem", input);
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
			
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}






	@Override
	public int editAdminOneOnOne(OneOnOne input) throws Exception {
		 int result = 0;
	        try {
	            result = sqlSession.update("AdminOneOnOneMapper.updateItem2", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        }

	        return result;
	}


	public int deleteAdminOneOnOne(OneOnOne input) throws Exception {
		 int result = 0;
	        try {
	            
	            result =sqlSession.delete("AdminOneOnOneMapper.deleteItem", input);
	            result +=sqlSession.delete("AdminOneOnOneMapper.deleteItem2", input);
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("삭제된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 삭제에 실패했습니다.");
	        }

	        return result-1;
	}


	
	
	@Override
	public List<OrderList> getAdminOrderListList(OrderList input) throws Exception {
		List<OrderList> result = null;
		
		
		try {
			result = sqlSession.selectList("AdminOrderListMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}




	@Override
	public int getAdminOrderListCount(OrderList input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("AdminOrderListMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}



	@Override
	public OrderList getAdminOrderListItem(OrderList input) throws Exception {
		OrderList result = null;
		try {
			result = sqlSession.selectOne("AdminOrderListMapper.selectItem",input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public List<ProductOrder> getAdminProductOrderList(ProductOrder input) throws Exception {
		List<ProductOrder> result = null;
		
		
		try {
			result = sqlSession.selectList("AdminOrderListMapper.selectList2", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}



	@Override
	public int editAdminOrderList(OrderList input) throws Exception {
		int result = 0;
        try {
            result = sqlSession.update("AdminOrderListMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
	}



	@Override
	public List<Member> getAdminMemberList(Member input) throws Exception {
	List<Member> result = null;
		
		
		try {
			result = sqlSession.selectList("AdminMemberMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getAdminMemberCount(Member input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("AdminMemberMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}



	@Override
	public Member getAdminMemberItem(Member input) throws Exception {
		Member result = null;
		try {
			result = sqlSession.selectOne("AdminMemberMapper.selectItem",input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터조회에 실패했습니다.");
		}
		
		return result;
	}





	@Override
	public int editAdminMember(Member input) throws Exception {
		int result = 0;
        try {
            result = sqlSession.update("AdminMemberMapper.updateItem2", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
	}






	@Override
	public List<Review> getAdminReviewList(Review input) throws Exception {
	List<Review> result = null;
		try {
			result = sqlSession.selectList("AdminReviewMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}




	@Override
	public int getAdminReviewCount(Review input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("AdminReviewMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}


	@Override
	public Review getAdminReviewItem(Review input) throws Exception {
		Review result = null;
		try {
			result = sqlSession.selectOne("AdminReviewMapper.selectItem",input);
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터조회에 실패했습니다.");
		}
		
		return result;
	}






	@Override
	public int addAdminReview(Review input) throws Exception {
		int result =0;
		try {
			result= sqlSession.insert("AdminReviewMapper.insertItem",input);
			sqlSession.update("AdminReviewMapper.updateItem", input);
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
			
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}





	@Override
	public int deleteAdminReview(Review input) throws Exception {
		 int result = 0;
	        try {
	            
	            result =sqlSession.delete("AdminReviewMapper.deleteItem", input);
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("삭제된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 삭제에 실패했습니다.");
	        }

	        return result;
	}

























	
	
	
	

}
