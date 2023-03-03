package javastudy;

public class TakeTrans {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student1 studentJames = new Student1("James",5000);
		Student1 studentTomas = new Student1("Tomas",10000);
		
		Bus bus100 = new Bus(100);
		Subway SubwayGreen = new Subway("2호선");
		
		studentJames.takeBus(bus100);
		studentJames.showInfo();
		bus100.showInfo();
		
		studentTomas.takeSubway(SubwayGreen);
		studentTomas.showInfo();
		SubwayGreen.showInfo();
		
	}
}
