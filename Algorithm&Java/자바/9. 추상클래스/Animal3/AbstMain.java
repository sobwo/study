package javastudy;

import java.util.ArrayList;
import java.util.Scanner;

public class AbstMain {
	public static void main(String[] args) {
		//동물클래스를 상속받아서 Human, Duck 클래스를 각각 구현
		//ex) 사람은 다리가 2개이고, 손이 2개며 하루 3끼를 먹고 밤에 자고 낮에 논다.
		//	  오리는 다리가 2개이고 날개가 2개이며 하루 1끼를 먹고 낮에 자고 밤에 논다.
		//객체생성 상속 다형성, if문 for문 연산자 추상클래스 등을 활용해서 작성
	
		ArrayList<Animal3> humanList = new ArrayList<>();
		ArrayList<Animal3> duckList = new ArrayList<>();
		
		Scanner sc = new Scanner(System.in);
		
		int selectNum;
		int totalNum;
		int ifNum;
		String name;
		
		//각 오리 및 사람의 입력 후 그 수만큼 객체 생성
		while(true) {
		System.out.println("선택하시오. 1(사람)  2(오리)");
	
		selectNum=sc.nextInt();
		if(selectNum==1) {
			System.out.println("사람 수를 입력하시오 : ");
			
			totalNum = sc.nextInt();
			for(int i=0;i<totalNum;i++) {
				System.out.println("사람 이름을 입력하시오 : ");
				name= sc.next();
				humanList.add(new Human(name));
				}
			
			for(int i=0;i<humanList.size();i++) {
				System.out.println((i+1)+"번째 사람의 정보");
				humanList.get(i).info();
				}
			System.out.println("추가로 입력하시겠습니까? 1(예) 2(아니오)");
			ifNum=sc.nextInt();
			if(ifNum==1) continue;
			else break;
			}
		
		else if(selectNum==2) {
			System.out.println("오리 수를 입력하시오 : ");
			
			totalNum = sc.nextInt();
			for(int i=0;i<totalNum;i++) {
				System.out.println("오리 이름을 입력하시오 : ");
				name= sc.next();
				duckList.add(new Duck(name));
			}
			for(int i=0;i<duckList.size();i++) {
				System.out.println((i+1)+"번째 오리의 정보");
				duckList.get(i).info();
			}
			System.out.println("추가로 입력하시겠습니까? 1(예) 2(아니오)");
			ifNum=sc.nextInt();
			if(ifNum==1) continue;
			else break;
			}
		else
			continue;
		}
		
	}
}

