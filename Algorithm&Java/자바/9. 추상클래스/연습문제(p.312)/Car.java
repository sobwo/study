package javastudy;

public abstract class Car {
	String name;
	public Car() {
		
	}
	
	public void start() {
		System.out.println(this.name+" 시동을 켭니다.");
	}
	public void drive() {
		System.out.println(this.name+" 달립니다.");
	}
	public void stop() {
		System.out.println(this.name+" 멈춥니다.");
	}
	public void turnoff() {
		System.out.println(this.name+" 시동을 끕니다.");
	}
	public void washCar() {
		System.out.println("세차를 합니다.");
	}
	
	final void run() {
		start();
		drive();
		stop();
		turnoff();
		washCar();
	}
}
