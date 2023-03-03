package javastudy;

public class Human extends Animal3{
	
	public Human(String name) {
		super(name);

	}
	
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 낮에 논다");
	}

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 하루 3끼를 먹는다.");
	}

	@Override
	public void sleep() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 밤에 잔다.");
	}
	
	@Override
	public void info() {
		System.out.println(super.name+"은 다리와 팔이 2개이다.");
		play();
		eat();
		sleep();
	}

}
