package com.basket;

public class CupengDTO {

	private int cno;
	private String p_name;
	private int pay;
	private int cnt;
	private String id;
	private String pw;
	private String name;
	private String card_no;
	private String c_name;
	private String h_name;
	private int no;
	private String board;
	private String h_hiredate;
	private String reviewdate;
	private int rownum;
	private String addr;
	
	// Ãß°¡µÈ ºÎºÐ
	private int total; // ÃÑ ÆÇ¸Å¾×

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getH_hiredate() {
		return h_hiredate;
	}

	public void setH_hiredate(String h_hiredate) {
		this.h_hiredate = h_hiredate;
	}

	public String getreviewdate() {
		return reviewdate;
	}

	public void setreviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	// total Ãß°¡
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	// toString() ½ÃÀÛºÎºÐ --------------------------------------------------------------------------------------------------

	@Override
	public String toString() {
		String str;
		str = String.format("¦¢" + "%-5d %s %10d %10d" + " ¦¢", rownum, convert(p_name, 35), pay, cnt);

		return str;
	}
	
	public String toString2() {
		String str;
		str = String.format("¦¢" + "%-5d %s %10d %10d" + " ¦¢", cno, convert(h_name, 35), pay, cnt);

		return str;
	}
	
	public String toStringReview() {
		String str;
		str = String.format("%-2d %3s %-2s", no, id, board);

		return str;
	}
	
	public String toStringCategoryTotalSal() {
		String str;

		str = String.format("%3d %3s %6d %,10d", cno,convert(h_name, 35),cnt, total);

		return str;
	}

	
	public String toStringProductTotalSal() {
		String str;

		str = String.format("%3d %3s %,5d %,10d", cno,convert(h_name, 35),cnt,total);

		return str;
	}

	private static int getKorCnt(String kor) {
	    int cnt = 0;
	    for (int i = 0 ; i < kor.length() ; i++) {
	        if (kor.charAt(i) >= '°¡' && kor.charAt(i) <= 'ÆR') {
	            cnt++;
	        }
	    } return cnt;
	}
	
	public static String convert(String word, int size) {
	    String formatter = String.format("%%%ds", size -getKorCnt(word));
	    return String.format(formatter, word);
	}
	
	
}
