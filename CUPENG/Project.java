package com.basket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;


public class Project {

	ProjectDAO dao = new ProjectDAO();
	Scanner sc = new Scanner(System.in);

	// 로그인 성공시 연결할 객체 생성
	Cupeng cup = new Cupeng();
	Basket bk = new Basket();
	
	Rocket r = new Rocket();
	
	// singleton으로 임시저장소
	public BasketList bList = BasketList.getInstance();

	public void join() throws InterruptedException {
		r.rocketjoin("","","","");
		System.out.print("이름을 입력하세요: ");
		String name = sc.next();
		r.rocketjoin(name,"","","");
		
		System.out.print("아이디를 입력하세요: ");
		String id = sc.next();
		r.rocketjoin(name,id,"","");
		
		System.out.print("비밀번호를 입력하세요: ");
		String pw = sc.next();
		r.rocketjoin(name,id,pw,"");
		
		System.out.print("집주소를 입력하세요: ");
		String addr = sc.next();
		r.rocketjoin(name,id,pw,addr);
		Thread.sleep(500);
		
		CupengDTO dto = new CupengDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPw(pw);
		dto.setAddr(addr);

		bList.id = dto.getId();
		int result = dao.join(dto);
		
		if (result > 0) {
			for(int i=0; i<10; i++) {
				r.rocketjoinSuccess1();
				Thread.sleep(150);
				r.rocketjoinSuccess2();
				Thread.sleep(150);
			}
			
		} else if (result == -1) {
			System.out.println("이미 존재하는 아이디입니다.");
		} else {
			System.out.println("회원가입에 실패하였습니다.");
		}
	}

	public void login() {
		CupengDTO dto = new CupengDTO();
		
		try {
			
			r.rocketlogin1("", "");
			
			System.out.println("ID 입력:");
			dto.setId(sc.next());
			r.rocketlogin1(dto.getId(), "");
			
			System.out.println("PW 입력:");
			dto.setPw(sc.next());
			r.rocketlogin1(dto.getId(), dto.getPw());
			
			int result = dao.login(dto);
			
			if (result != 0 && dto.getId().equals("admin")) {
				System.out.println("관리자 로그인 성공");
				adminMenu();
			}
			else if(result != 0) {
				System.out.println("로그인 성공");
				bList.setId(dto.getId());
				Thread.sleep(1000);
				//쿠팡 시작
				startCupeng();
			}else {
				System.out.println("로그인 실패");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void selectCategory() throws InterruptedException {
		//serchCategory();
		
		r.Rocketselcetcategory();

		int num = sc.nextInt();

		// 돌아가기
		if (num == 0) {
			return;
		}
		
		List<CupengDTO> lists = dao.selcategory(num);
		
		int cnt = 1;
		int index = 0;
		
		Iterator<CupengDTO> it = lists.iterator();
		
		String[] cs = new String[10];
		
		while (it.hasNext()) {
			
			CupengDTO dto = it.next();
			// 카테고리 리스트 출력 하는곳
			if(index % 10 == 0) {
				for(int i=0; i<5; i++) {
					cs[i] = "";
				}
				index = 0;
			}
			
			cs[index] = dto.toString();
			
			if(cnt % 10 == 0 || cnt == lists.size()) {
				
				r.appleCategory(cs,1);
				
				num = sc.nextInt();
				if(num == 1) {
					r.appleCategory(cs,2);
					insertCategory(lists, cs);
					break;
				}
				else if(num == 2) {
					cnt ++;
					index = 0;
					continue;
				}
				else if(num == 3) {
					break;
				}
			}
			cnt++;
			index++;
		}
	}
	
	public void insertCategory(List<CupengDTO> lists, String[] cs) throws InterruptedException {

		// 상품 선택 추가
		while (true) {
			int p_number = sc.nextInt();
			
			if (p_number == 0) {
				break;
			}
			Iterator<CupengDTO> it = lists.iterator();
			while (it.hasNext()) {
				
				CupengDTO dto2 = it.next();
				
				if (p_number == dto2.getRownum()) {
					r.appleCategory(cs,3);
					System.out.println("                                                       " + dto2.getP_name() + " 장바구니 추가 완료.");
					bk.insertProduct(dto2);
					Thread.sleep(800);
					r.appleCategory(cs,2);
					break;
				}
			}
		}
	}
	
	// 1. 관리자 /전체 상품 확인 실행
	public void searchProduct() {

		ProjectDAO dao = new ProjectDAO();

		List<CupengDTO> productList = dao.searchProdct();
		for (CupengDTO product : productList) {
			// 조회된 상품 정보 출력
			System.out.println(product.toString());
		}

	}

	// 2. 관리자 /상품추가 실행
	public void insertProduct() {
		CupengDTO dto = new CupengDTO();

		try {
			
			System.out.println("상품 카테고리 등록");
			System.out.println("1.과일 2.정육 3.채소 4.수산/건어물 5.베이커리 6.간식");
			dto.setCno(sc.nextInt());

			System.out.println("추가할 제품 이름");
			dto.setP_name(sc.next());

			System.out.println("추가할 제품 가격:");
			dto.setPay(sc.nextInt());

			System.out.println("재고수량?");
			dto.setCnt(sc.nextInt());

			int result = dao.insertProduct(dto);
			if (result != 0) {
				System.out.println("상품 추가 성공");
			} else {
				System.out.println("상품 추가 실패");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 3. 관리자 /상품수정 실행
	public void updateProduct() {
		CupengDTO dto = new CupengDTO();

		try {
			System.out.println("수정 할 제품 번호:");
			dto.setCno(sc.nextInt());

			System.out.println("수정 할 제품명:");
			dto.setP_name(sc.next());

			System.out.println("수정 할 가격:");
			dto.setPay(sc.nextInt());

			System.out.println("수정 할 재고수량:");
			dto.setCnt(sc.nextInt());

			int result = dao.updateProduct(dto);
			if (result > 0) {
				System.out.println("상품 수정 성공");
			} else {
				System.out.println("상품 수정 실패");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	// 4. 관리자 /상품제거 실행
	public void deleteProduct() {

		try {

			System.out.println("삭제할 제품번호:");
			int rownum = sc.nextInt();

			int result = dao.deleteProduct(rownum);

			if (result != 0)
				System.out.println("삭제 성공");
			else
				System.out.println("삭제 실패");

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 5. 관리자 /판매 재고 조회 실행
		public void SalesInventory() {
			ProjectDAO dao = new ProjectDAO();
			List<CupengDTO> salesInventory = dao.SalesInventory();
			for (CupengDTO product : salesInventory) {
				System.out.println(product.toString2());
			}
			
		}

	// 6. 관리자 /전체 회원 보기 실행
	public void getAllMembers() {
		List<CupengDTO> members = dao.getAllMembers();

		if (!members.isEmpty()) {
			System.out.println("전체 회원 정보:");
			for (CupengDTO dto : members) {
				System.out.println("ID: " + dto.getId());
				System.out.println("pw: " + dto.getPw());
				System.out.println("이름: " + dto.getName());
				System.out.println("주소: " + dto.getAddr());
				System.out.println("---------------------");
			}
		} else {
			System.out.println("등록된 회원이 없습니다.");
		}
	}

// 관리자 로그인 및 관리자 메뉴 시작
	public void admimnLogin() {
		CupengDTO dto = new CupengDTO();

		try {
			System.out.println("관리자 모드에 오신 것을 환영합니다.");
			System.out.println("관리자 ID 입력:");
			dto.setId(sc.next());
			
			System.out.println("관리자 PW 입력:");
			dto.setPw(sc.next());

			int result = dao.adminLlogin(dto);
			
			if (result != 0) {
				System.out.println("관리자 로그인 성공");
				adminMenu();
			} else {
				System.out.println("관리자 로그인 실패");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void adminMenu() {
		System.out.println(r.back);
		Scanner sc = new Scanner(System.in);
		int choice;

		do {
			System.out.println("관리자모드");
			System.out.println("1. 상품 전체 조회");
			System.out.println("2. 상품 추가");
			System.out.println("3. 상품 수정");
			System.out.println("4. 상품 제거");
			System.out.println("5. 판매 재고 조회");
			System.out.println("6. 전체 회원 조회");

			// 7,8번 추가
			System.out.println("7. 카테고리 매출 조회");
			System.out.println("8. 전체 매출 조회");
			System.out.println("0. 종료");

			System.out.print("메뉴를 선택하세요: ");
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				System.out.println(r.back);
				searchProduct();
				break;
			case 2:
				System.out.println(r.back);
				insertProduct();
				break;
			case 3:
				System.out.println(r.back);
				updateProduct();
				break;
			case 4:
				System.out.println(r.back);
				deleteProduct();
				break;
			case 5:
				System.out.println(r.back);
				SalesInventory();
				break;
			case 6:
				System.out.println(r.back);
				getAllMembers();
				break;
			case 7:
				System.out.println(r.back);
				productTotalSal();
				break;
			case 8:
				System.out.println(r.back);
				catecoryTotalSal();
				break;

			case 0:
				System.out.println("관리자 모드를 종료합니다.");
				break;
			default:
				System.out.println("잘못된 선택입니다. 다시 선택하세요.");
			}
			System.out.println();
		} while (choice != 0);
	}

	// 카테고리별 매출 현황(뭐뭐 팔렸는지 리스트까지 쭉)

	public void productTotalSal() {

		List<CupengDTO> lists = new ArrayList<CupengDTO>();

		System.out.println("카테고리별 매출 현황 입니다.");
		System.out.println("카테고리 번호를 입력해 주세요");
		int ch = sc.nextInt();

		lists = dao.catecorySal(ch);

		Iterator<CupengDTO> it = lists.iterator();

		while (it.hasNext()) {
			CupengDTO dto = it.next();
			
			System.out.println(dto.toStringProductTotalSal());
		}
	}

	// 총 매출 현황
	public void catecoryTotalSal() {

		List<CupengDTO> lists = new ArrayList<CupengDTO>();

		System.out.println("총 매출 현황 입니다.");

		lists = dao.totalSal();

		Iterator<CupengDTO> it = lists.iterator();

		while (it.hasNext()) {
			CupengDTO dto = it.next();
			System.out.println(dto.toStringCategoryTotalSal());
		}
	}

	// 로그인 성공시 쿠팡 시작
	public void startCupeng() throws InterruptedException {

		int ch;

		while (true) {
			
			do {
				r.menuRocket(bList.id);
				ch = sc.nextInt();
			} while (ch < 1 || ch > 7);

			switch (ch) {
			case 1:
				selectCategory();
				break;
			case 2:
				cup.selectP();
				break;
			case 3:
				bk.choiceProduct();
				break;
			case 4:
				bk.selectAllHistory();
				break;
			case 5:
				cup.review();
				break;
			case 6:
				for(int i=0; i<10; i++) {
					r.rocketLogout(1);
					Thread.sleep(300);
					r.rocketLogout(2);
					Thread.sleep(300);
				}
				return;
			case 7:
				System.exit(0);
			}

		}

	}

}
