package javastudy;

public class CafeUser {
	String userName;
	int userMoney;
	String menu;
	
	CafeUser(String name, int money, String menu){
		this.userName = name;
		this.userMoney = money;
		this.menu = menu;
	}
	
	public void takeByeol(CafeByeol cafeByeol) {
		cafeByeol.takeByeol(menu,2500);
		this.userMoney -= 2500;
	}
	
	public void takeCong(CafeCong cafeCong) {
		cafeCong.takeCong(menu, 3000);
		this.userMoney -= 3000;
	}
	
	public void showInfo() {
		System.out.println(userName+"이 주문한 음료는 "+menu+"이고 남은 돈은 "+userMoney+"입니다.");
	}
}
