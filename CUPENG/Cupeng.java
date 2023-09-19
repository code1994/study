package com.basket;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Cupeng extends Thread {
	Scanner sc = new Scanner(System.in);
	CupengDAO dao = new CupengDAO();

	Basket bk = new Basket();
	// singleton���� �ӽ������
	public BasketList bList = BasketList.getInstance();
	
	public Rocket r = new Rocket();
	
	// ��ǰ��˻�
	public void selectP() throws InterruptedException {
		r.spa("", null, 1);
		// �˻��� �Է�
		String p_name = sc.next();
		
		r.spa(p_name, null, 1);
		Thread.sleep(500);

		List<CupengDTO> lists = dao.searchPname(p_name);
		if (lists.isEmpty()) {
			r.notSpaiderman(p_name);
			Thread.sleep(1000);
			return;
		}
		Iterator<CupengDTO> it = lists.iterator();
		
		int cnt = 1;
		int index = 0;
		int num;
		
		String[] cs = new String[10];

		while (it.hasNext()) {
			CupengDTO dto = it.next();
			System.out.println(dto.toString());

			if (index % 10 == 0) {
				index = 0;
			}

			cs[index] = dto.toString();

			if (cnt % 10 == 0 || cnt == lists.size()) {
				r.spa(p_name, cs, 2);
				num = sc.nextInt();
				if (num == 1) {
					r.spa(p_name, cs, 3);
					insertB(lists, p_name, cs);
				}
				if (num == 2) {
					cnt++;
					if (cnt > lists.size()) {
						break;
					}
					continue;
				}
				if (num == 3) {
					break;
				}
			}
			cnt++;
			index++;
		}
	}

	// ���亸��
	public void reviewAll() {
		List<CupengDTO> lists = dao.getReviewList();
		Iterator<CupengDTO> it = lists.iterator();

		String[] cs = new String[5];
		int cnt = 1;
		int index = 0;
		int num;
		
		while (it.hasNext()) {
			CupengDTO dto = it.next();
			
			if (index % 5 == 0) {
				for (int i = 0; i < 5; i++) {
					cs[i] = "";
				}
				index = 0;
			}
			cs[index] = dto.toStringReview();
			
			if (cnt % 5 == 0 || cnt == lists.size()) {
				
				r.selectReview(cs);
				
				num = sc.nextInt();
				if (num == 1) {
					cnt++;
					index = 0;
					continue;
				} else if (num == 2) {
					break;
				}
			}
			cnt++;
			index++;

		}
	}

	// ���亸��
	public void review() {
		r.rocketReview(1, "");
		int ch = sc.nextInt();

		if (ch == 1) {
			reviewWrite();
		}
		if (ch == 2) {
			reviewAll();
		}
	}

	// �����ۼ�(DTO����)
	public void reviewWrite() {
		try {
			CupengDTO dto = new CupengDTO();
			r.rocketReview(2, "");
			dto.setBoard(sc.next());
			r.rocketReview(2, dto.getBoard());
			Thread.sleep(2000);
			int result = dao.insertReview2(dto);

			if (result != 0)
				System.out.println("���䰡 �ۼ��Ǿ����ϴ�.");

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void selectCategory() {

		int num = sc.nextInt();

		List<CupengDTO> lists = dao.selcategory(num);

		Iterator<CupengDTO> it = lists.iterator();
		while (it.hasNext()) {
			CupengDTO dto = it.next();
			System.out.println(dto.toString2());

		}

		num = sc.nextInt();

		CupengDTO dto = new CupengDTO();

		for (CupengDTO d : lists) {
			if (num == d.getRownum()) {
				dto.setRownum(d.getRownum());
				dto.setP_name(d.getP_name());
				dto.setPay(d.getPay());
				dto.setCnt(d.getCnt());
				bk.insertProduct(dto);
			}
		}
	}

	public CupengDTO insertB(List<CupengDTO> lists, String p_name, String[] cs) {
		CupengDTO selectedProduct = null;
		do {
//			System.out.println("1. ��ǰ����. 2.���ư���");
//			int ch = sc.nextInt();

			int p_number = sc.nextInt();

			if (p_number == 0) {
				break;
			} else {
				Iterator<CupengDTO> it = lists.iterator();
				while (it.hasNext()) {

					r.spa(p_name, cs, 3);

					CupengDTO dto = it.next();

					if (p_number == dto.getRownum()) {
						CupengDTO d = new CupengDTO();
						d.setRownum(dto.getRownum());
						d.setP_name(dto.getP_name());
						d.setPay(dto.getPay());
						d.setCnt(dto.getCnt());
						bk.insertProduct(dto);
						System.out.println(
								"                                                                                 "
										+ dto.getP_name() + " ��ٱ��� �߰� �Ϸ�");
						break;
					}
				}
			}
		} while (selectedProduct == null);

		return selectedProduct;
	}
}
