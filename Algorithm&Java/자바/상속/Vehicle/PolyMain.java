package javastudy;

public class PolyMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Vehicle motocycle = new Motocycle(2);
		Vehicle sonata = new Car(4);
		Car avante = new Car(4);
		
		motocycle.move();
		sonata.move();
		avante.move(40);
		
		//업캐스팅을 하면 부모와 자식이 가지고있는 공통기능을 쓸수있는데
		//부모기능보다 더 나은 자식기능이 있다면 오버라이딩
	}
}
