package javastudy;

public class Vehicle {
	private int wheel;
	
	public Vehicle(int wheel) {
		this.wheel = wheel;
	}
	
	public void move() {
		System.out.println(wheel+"개의 바퀴를 가진 자동차가 달린다.");
	}
	
	public int getWheel() {
		return this.wheel;
	}
}


