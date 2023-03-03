package javastudy;

import java.util.ArrayList;

public class CafeByeol {
	int money;
	ArrayList<String> menu= new ArrayList<String>();
	int count;
	
	CafeByeol(){
	}
	
	public void takeByeol(String menu, int money) {
		this.menu.add(menu);
		this.money += money;
		this.count++;
	}
	
	public void showInfo() {
		System.out.println("별다방 현재까지 주문한 음료는 ");
		for(int i=0;i<menu.size();i++)
			System.out.print(menu.get(i)+" ");
		System.out.println("입니다.");
		System.out.println("별다방 수입은 "+money+"이고 이용 고객 수는 "+count+"입니다.");
	}
}
