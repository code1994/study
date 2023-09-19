package com.basket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;


public class Project {

	ProjectDAO dao = new ProjectDAO();
	Scanner sc = new Scanner(System.in);

	// �α��� ������ ������ ��ü ����
	Cupeng cup = new Cupeng();
	Basket bk = new Basket();
	
	Rocket r = new Rocket();
	
	// singleton���� �ӽ������
	public BasketList bList = BasketList.getInstance();

	public void join() throws InterruptedException {
		r.rocketjoin("","","","");
		System.out.print("�̸��� �Է��ϼ���: ");
		String name = sc.next();
		r.rocketjoin(name,"","","");
		
		System.out.print("���̵� �Է��ϼ���: ");
		String id = sc.next();
		r.rocketjoin(name,id,"","");
		
		System.out.print("��й�ȣ�� �Է��ϼ���: ");
		String pw = sc.next();
		r.rocketjoin(name,id,pw,"");
		
		System.out.print("���ּҸ� �Է��ϼ���: ");
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
			System.out.println("�̹� �����ϴ� ���̵��Դϴ�.");
		} else {
			System.out.println("ȸ�����Կ� �����Ͽ����ϴ�.");
		}
	}

	public void login() {
		CupengDTO dto = new CupengDTO();
		
		try {
			
			r.rocketlogin1("", "");
			
			System.out.println("ID �Է�:");
			dto.setId(sc.next());
			r.rocketlogin1(dto.getId(), "");
			
			System.out.println("PW �Է�:");
			dto.setPw(sc.next());
			r.rocketlogin1(dto.getId(), dto.getPw());
			
			int result = dao.login(dto);
			
			if (result != 0 && dto.getId().equals("admin")) {
				System.out.println("������ �α��� ����");
				adminMenu();
			}
			else if(result != 0) {
				System.out.println("�α��� ����");
				bList.setId(dto.getId());
				Thread.sleep(1000);
				//���� ����
				startCupeng();
			}else {
				System.out.println("�α��� ����");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void selectCategory() throws InterruptedException {
		//serchCategory();
		
		r.Rocketselcetcategory();

		int num = sc.nextInt();

		// ���ư���
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
			// ī�װ� ����Ʈ ��� �ϴ°�
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

		// ��ǰ ���� �߰�
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
					System.out.println("                                                       " + dto2.getP_name() + " ��ٱ��� �߰� �Ϸ�.");
					bk.insertProduct(dto2);
					Thread.sleep(800);
					r.appleCategory(cs,2);
					break;
				}
			}
		}
	}
	
	// 1. ������ /��ü ��ǰ Ȯ�� ����
	public void searchProduct() {

		ProjectDAO dao = new ProjectDAO();

		List<CupengDTO> productList = dao.searchProdct();
		for (CupengDTO product : productList) {
			// ��ȸ�� ��ǰ ���� ���
			System.out.println(product.toString());
		}

	}

	// 2. ������ /��ǰ�߰� ����
	public void insertProduct() {
		CupengDTO dto = new CupengDTO();

		try {
			
			System.out.println("��ǰ ī�װ� ���");
			System.out.println("1.���� 2.���� 3.ä�� 4.����/�Ǿ 5.����Ŀ�� 6.����");
			dto.setCno(sc.nextInt());

			System.out.println("�߰��� ��ǰ �̸�");
			dto.setP_name(sc.next());

			System.out.println("�߰��� ��ǰ ����:");
			dto.setPay(sc.nextInt());

			System.out.println("������?");
			dto.setCnt(sc.nextInt());

			int result = dao.insertProduct(dto);
			if (result != 0) {
				System.out.println("��ǰ �߰� ����");
			} else {
				System.out.println("��ǰ �߰� ����");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 3. ������ /��ǰ���� ����
	public void updateProduct() {
		CupengDTO dto = new CupengDTO();

		try {
			System.out.println("���� �� ��ǰ ��ȣ:");
			dto.setCno(sc.nextInt());

			System.out.println("���� �� ��ǰ��:");
			dto.setP_name(sc.next());

			System.out.println("���� �� ����:");
			dto.setPay(sc.nextInt());

			System.out.println("���� �� ������:");
			dto.setCnt(sc.nextInt());

			int result = dao.updateProduct(dto);
			if (result > 0) {
				System.out.println("��ǰ ���� ����");
			} else {
				System.out.println("��ǰ ���� ����");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	// 4. ������ /��ǰ���� ����
	public void deleteProduct() {

		try {

			System.out.println("������ ��ǰ��ȣ:");
			int rownum = sc.nextInt();

			int result = dao.deleteProduct(rownum);

			if (result != 0)
				System.out.println("���� ����");
			else
				System.out.println("���� ����");

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 5. ������ /�Ǹ� ��� ��ȸ ����
		public void SalesInventory() {
			ProjectDAO dao = new ProjectDAO();
			List<CupengDTO> salesInventory = dao.SalesInventory();
			for (CupengDTO product : salesInventory) {
				System.out.println(product.toString2());
			}
			
		}

	// 6. ������ /��ü ȸ�� ���� ����
	public void getAllMembers() {
		List<CupengDTO> members = dao.getAllMembers();

		if (!members.isEmpty()) {
			System.out.println("��ü ȸ�� ����:");
			for (CupengDTO dto : members) {
				System.out.println("ID: " + dto.getId());
				System.out.println("pw: " + dto.getPw());
				System.out.println("�̸�: " + dto.getName());
				System.out.println("�ּ�: " + dto.getAddr());
				System.out.println("---------------------");
			}
		} else {
			System.out.println("��ϵ� ȸ���� �����ϴ�.");
		}
	}

// ������ �α��� �� ������ �޴� ����
	public void admimnLogin() {
		CupengDTO dto = new CupengDTO();

		try {
			System.out.println("������ ��忡 ���� ���� ȯ���մϴ�.");
			System.out.println("������ ID �Է�:");
			dto.setId(sc.next());
			
			System.out.println("������ PW �Է�:");
			dto.setPw(sc.next());

			int result = dao.adminLlogin(dto);
			
			if (result != 0) {
				System.out.println("������ �α��� ����");
				adminMenu();
			} else {
				System.out.println("������ �α��� ����");
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
			System.out.println("�����ڸ��");
			System.out.println("1. ��ǰ ��ü ��ȸ");
			System.out.println("2. ��ǰ �߰�");
			System.out.println("3. ��ǰ ����");
			System.out.println("4. ��ǰ ����");
			System.out.println("5. �Ǹ� ��� ��ȸ");
			System.out.println("6. ��ü ȸ�� ��ȸ");

			// 7,8�� �߰�
			System.out.println("7. ī�װ� ���� ��ȸ");
			System.out.println("8. ��ü ���� ��ȸ");
			System.out.println("0. ����");

			System.out.print("�޴��� �����ϼ���: ");
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
				System.out.println("������ ��带 �����մϴ�.");
				break;
			default:
				System.out.println("�߸��� �����Դϴ�. �ٽ� �����ϼ���.");
			}
			System.out.println();
		} while (choice != 0);
	}

	// ī�װ��� ���� ��Ȳ(���� �ȷȴ��� ����Ʈ���� ��)

	public void productTotalSal() {

		List<CupengDTO> lists = new ArrayList<CupengDTO>();

		System.out.println("ī�װ��� ���� ��Ȳ �Դϴ�.");
		System.out.println("ī�װ� ��ȣ�� �Է��� �ּ���");
		int ch = sc.nextInt();

		lists = dao.catecorySal(ch);

		Iterator<CupengDTO> it = lists.iterator();

		while (it.hasNext()) {
			CupengDTO dto = it.next();
			
			System.out.println(dto.toStringProductTotalSal());
		}
	}

	// �� ���� ��Ȳ
	public void catecoryTotalSal() {

		List<CupengDTO> lists = new ArrayList<CupengDTO>();

		System.out.println("�� ���� ��Ȳ �Դϴ�.");

		lists = dao.totalSal();

		Iterator<CupengDTO> it = lists.iterator();

		while (it.hasNext()) {
			CupengDTO dto = it.next();
			System.out.println(dto.toStringCategoryTotalSal());
		}
	}

	// �α��� ������ ���� ����
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
