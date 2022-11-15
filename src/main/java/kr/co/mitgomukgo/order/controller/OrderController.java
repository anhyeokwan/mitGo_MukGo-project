package kr.co.mitgomukgo.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.order.model.service.OrderService;
import kr.co.mitgomukgo.order.model.vo.Order;

@Controller
public class OrderController {
 @Autowired
 private OrderService service;
 
  @RequestMapping(value="/insertOrder.do")
  public String insertOrder(Cart c ,Model model) {
	  model.addAttribute("Order", c);
		return "order/order";
   }

}
