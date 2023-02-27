package javastudy;

public class Company {
	private static Company instance;
	
	private Company() {
	}

	//싱글톤 패턴 기본
	
	public static Company getInstance() {
		if(instance == null)
			instance = new Company();
		return instance;
	}
	
	
	//멀티스레드 환경에서 안전한 싱글톤 만드는 법
	/* lazy Initialization(게으른 초기화)
		- synchronized 동기화를 활용해 스레드를 안전하게 만듦
		- synchronized는 큰 성능저하를 발생시키므로 권장하지 않는 방법
	
	public static synchronized Company getInstance() {
		if(instance == null) instance = new Company();
		return instance;
	}
	 */
	
	/* Lazy Initialization + Double-checked Locking  위의 성능저하를 완화시키는 방법
		- 먼저 조건문으로 인스턴스의 존재 여부를 확인한 다음 두번째 조건문에서 synchronized를 통해 동기화를 시켜 인스턴스를 생성하는 방법
		- 스레드를 안전하게 만들면서, 처음 생성 이후에는 synchronized를 실행하지 않기 때문에 성능저하 완화가 가능함
		
	public static Company getInstance(){
		if(instance==null)
			synchronized(Company.class)
				if(instance==null) instance = new Company();
	}
	 */
	
	/* holder에 의한 초기화   
	   - JVM의 클래스 초기화 과정에서 보장되는 원자적 특성을 이용해 싱글톤의 초기화 문제에 대한 책임을 JVM에게 떠넘기는 걸 활용함
	   - 클래스 안에 선언한 클래스인 holder에서 선언된 인스턴스는 static이기 때문에 클래스 로딩시점에서 한번만 호출된다. 또한 final을 사용해서 다시 값이 할당되지 않도록 만드는 방식을 사용한 것
	   - 가장 많이 활용
	   
	public static class LazyHolder{
		public static final Company INSTANCE = new Company();
	}
	
	public static Company getInstance(){
		return LazyHolder.INSTANCE;
	}
	 */
}
