package javastudy;

import java.util.HashMap;

public class CarFactory {
	private static CarFactory instance;
	HashMap<String, Car> map = new HashMap<>();
	
	String carName;
	int i=0;
	private CarFactory() {
	}
	
	public static CarFactory getInstance() {
		if(instance == null)
			instance = new CarFactory();
		return instance;
	}
	
	public Car createCar(String carName) {
		if(map.containsKey(carName)) {
			return map.get(carName);
		}
		Car car = new Car();
		map.put(carName, car);
		return car;
	
	}
}
