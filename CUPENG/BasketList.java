package com.basket;

import java.util.ArrayList;
import java.util.List;

public class BasketList {
	
	public static BasketList instance;
	
	public static BasketList getInstance() {
		
		try {
			
			if(instance == null) {
				instance = new BasketList();
				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		 return instance;
	}
	
	public List<CupengDTO> lists = new ArrayList<CupengDTO>();
	
	// id는 하나로 통일하기 위해 추가?
	public String id;
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	// 장바구니 넣기
	public void insertBasket(CupengDTO dto) {
		if(lists.indexOf(dto) < 0) {
			lists.add(dto);
		}
		else {
			// 이미 담겨있는 상품일경우
			// 수정필요 중복됨
			int find = lists.indexOf(dto);
			lists.get(find).setCnt(1);
		}
	}
	
	// 한개 지우기
	public void deleteBasket(int index) {
		
		if(lists.get(index) == null) {
			System.out.println("해당 번호에 상품이 없습니다.");
			return;
		}
		
		lists.remove(index);
		
	}
	// 전체 삭제
	public void deleteAllBasket() {
		
		lists.clear();;
		
	}
	
	
}
