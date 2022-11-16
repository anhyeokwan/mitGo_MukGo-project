package kr.co.mitgomukgo.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.order.model.dao.OrderDao;
import kr.co.mitgomukgo.order.model.vo.Order;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;
	
	public int insertOrder(int pNo, Order or) {
	      // TODO Auto-generated method stub
	      return dao.insertOrder(or);
	   }
	

//	@Transactional
//	public int insertOrder(Order or) {
//		int result = dao.insertOrder(or);
//		
//		
//		return result;
//	}
//


}
