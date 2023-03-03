package javastudy;

public abstract class Abstract {
	/*
		추상클래스
		- 초기 클래스 설계시 구현이 명확하지 않는 기능 선언
		- 추상클래스는 일반 클래스와 별 다를 것이 없음 
		- 추상 메서드를 선언하여 상속을 통해서 자손 클래스에서 완성하도록 유도하는 클래스 
		- 상속을 위한 클래스이기 때문에 따로 객체를 생성할 수 없음
	 */
	
	private int z;
	
	public Abstract(int s) {
		this.z=s;
	}
	
	public int getZ() {
		return this.z;
	}
	
	int a = 1;
	public void move() {}
	
	public abstract void fly();
}
