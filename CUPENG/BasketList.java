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
	
	// id�� �ϳ��� �����ϱ� ���� �߰�?
	public String id;
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	// ��ٱ��� �ֱ�
	public void insertBasket(CupengDTO dto) {
		if(lists.indexOf(dto) < 0) {
			lists.add(dto);
		}
		else {
			// �̹� ����ִ� ��ǰ�ϰ��
			// �����ʿ� �ߺ���
			int find = lists.indexOf(dto);
			lists.get(find).setCnt(1);
		}
	}
	
	// �Ѱ� �����
	public void deleteBasket(int index) {
		
		if(lists.get(index) == null) {
			System.out.println("�ش� ��ȣ�� ��ǰ�� �����ϴ�.");
			return;
		}
		
		lists.remove(index);
		
	}
	// ��ü ����
	public void deleteAllBasket() {
		
		lists.clear();;
		
	}
	
	
}
