package com.basket;

import java.util.Scanner;

public class TestMain {

	public static void main(String[] args) throws InterruptedException {

		Scanner sc = new Scanner(System.in);

		Project ob = new Project();
		Rocket r = new Rocket();

		int ch;
		
		while (true) {
			do {
				r.mainRocket();
				ch = sc.nextInt();
			} while (ch < 1 || ch > 4);

			switch (ch) {

			case 1:
				ob.login();
				break;
			case 2:
				ob.join();
				break;
			case 3:
				ob.login();
				break;
			default:
				System.exit(0);

			}

		}

	}

}
