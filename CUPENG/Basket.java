package com.basket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Basket {

	public BasketList bList = BasketList.getInstance();
	BasketDAO dao = new BasketDAO();
	Scanner sc = new Scanner(System.in);
	int cnt = 1;
	public Rocket r = new Rocket();

	// 선택한 상품 보이기
	public void choiceProduct() throws InterruptedException {
//		if(bList.lists.retain() == null) {
//			System.out.println("아직 상품이 없습니다...");
//			return;
//		}
//		
		String[] cs = new String[10];
		int index = 0;
		int cnt = 1;
		Iterator<CupengDTO> it = bList.lists.iterator();

		int ch;
		while (it.hasNext()) {
			
			if (index % 10 == 0) {
				for (int i = 0; i < 10; i++) {
					cs[i] = "";
				}
				index = 0;
			}
			CupengDTO dto = it.next();
			cs[index] = dto.toString();

			if (cnt % 10 == 0 || cnt == bList.lists.size()) {
				r.basketString(cs);
				ch = sc.nextInt();

				switch (ch) {
				case 1:
					cnt++;
					index = 0;
					continue;
				case 2:
					buyBasket();
					it = bList.lists.iterator();
					break;
				case 3:
					deleteProduct();
					it = bList.lists.iterator();
					cnt = 0;
					index = -1;
					break;
				case 4:
					deleteAllProduct();
					it = bList.lists.iterator();
					break;
				case 5:
					cardInsert();
					break;
				case 6:
					return;
				case 7:
					System.exit(0);
				}
			}
			cnt++;
			index++;

		}

	}

	// 등록된 카드 구매
	public void buyBasket() throws InterruptedException {
		if (dao.cardCheck(bList.getId()) != 0) {
			// 등록되어있는 카드면 결제 완료 하고 구매내역 추가해주기
			dao.insertHistory(bList.lists);
			bList.lists.clear();
			sc.nextLine();

			// 로켓 발사
			for (int i = 0; i < 15; i++) {
				System.out.println(r.back);
				System.out.println(r.buyString());
				System.out.println(r.buyString2());
				r.plusBuyString("\n");
				Thread.sleep(250);
			}

		} else {
			System.out.println("등록된 카드가 없습니다. 결제수단을 등록해 주세요");
			cardInsert();
		}
	}

	// 장바구니 담기
	public void insertProduct(CupengDTO dto) {
		bList.insertBasket(dto);
	}

	// 장바구니에서 삭제
	public void deleteProduct() {
		System.out.println("지울 번호를 입력해 주세요");
		int ch = sc.nextInt();
		bList.deleteBasket(ch - 1);
	}

	public void deleteAllProduct() {
		bList.deleteAllBasket();
	}

	public void cardInsert() {
		CupengDTO dto = new CupengDTO();
		System.out.print("카드 번호를 입력해 주세요 : ");
		dto.setCard_no(sc.next());

		int result = dao.cardCheck(bList.getId());

		if (result == 0) {
			// 등록되어있는지 확인
			dao.insertCard(dto);
			System.out.println("등록 완료");
		} else {
			System.out.println("이미 등록되어 있습니다. 수정하시겠습니까?");
			System.out.println("1.수정  2.취소");
			int ch = sc.nextInt();
			if (ch == 1) {
				dao.updateCard(dto);
				System.out.println("수정 완료");
			} else {
				return;
			}
		}
	}

	public void selectAllHistory() {

		List<CupengDTO> li = new ArrayList<CupengDTO>();

		li = dao.selectHistory(bList.getId());
		
		if (li.isEmpty()) {
			return;
		}
		Iterator<CupengDTO> it = li.iterator();

		String[] cs = new String[10];
		int index = 0;
		int cnt = 1;
		int num;
		
		while (it.hasNext()) {
			CupengDTO dto = it.next();

			if (index % 10 == 0) {
				for (int i = 0; i < 10; i++) {
					cs[i] = "";
				}
				index = 0;
			}

			cs[index] = dto.toString2();

			if (cnt % 10 == 0 || cnt == li.size()) {
				r.rocketHistory(cs);
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
	
	public void basketPrint() {
		Iterator<CupengDTO> it = bList.lists.iterator();
		
		while (it.hasNext()) {
			
			CupengDTO bk = it.next();
			System.out.print(cnt++ + "번  ");
			System.out.println(bk.toString());
			
		}
		cnt = 1;
	}

}
