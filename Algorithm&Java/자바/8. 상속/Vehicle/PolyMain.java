package javastudy;

public class PolyMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Vehicle : 부모 클래스   Car, Motocycle : 자식 클래스
		
		Vehicle motocycle = new Motocycle(2);
		Vehicle sonata = new Car(4);
		Car avante = new Car(4);
		
		motocycle.move();
		sonata.move();
		avante.move(40);
		//업캐스팅을 하면 부모와 자식이 가지고있는 공통기능을 쓸수있는데
		//부모기능보다 더 나은 자식기능이 있다면 오버라이딩
		
		//업캐스팅
		Vehicle vehicle = new Car(4);
		
		//다운캐스팅 (불가)
		//Car car = new Vehicle 
		
		//업캐스팅되었다가 다시 다운캐스팅될때는 가능
		Car car = (Car)vehicle;
		
		// 부모객체가 자식타입으로 형변환 여부 확인 / 참이면 true 리턴
		if(car instanceof Vehicle){
			Car car2 = (Car) vehicle;
		}
		
	}
}
