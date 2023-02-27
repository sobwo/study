package javastudy;

public class Subway {
	String lineNumber;
	int passengerCount;
	int money;
	
	Subway(String lineNumber) {
		this.lineNumber = lineNumber;
	}
	
	public void take(int money) {
		this.money += money;
		passengerCount++;
	}
	
	public void showInfo() {
		System.out.println("지하철 "+this.lineNumber+"의 승객은 "+this.passengerCount+"명이고, 수입은 "+this.money+"입니다.");
	}
}
