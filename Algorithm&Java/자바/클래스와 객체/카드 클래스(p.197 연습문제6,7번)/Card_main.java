package javastudy;

public class Card_main {
	public static void main(String[] args) {
		Card card1 = new Card();
		Card card2 = new Card();
		Card_Singleton card3 = Card_Singleton.getInstance();
		Card_Singleton card4 = Card_Singleton.getInstance();
		
		card1.setUserName("홍길동");
		card2.setUserName("강감찬");
		card3.setUserName("a");
		card3.setUserName("b");
		
		System.out.println(card1.getUserName()+"의 카드번호는 "+card1.getCardId()+"입니다.");
		System.out.println(card2.getUserName()+"의 카드번호는 "+card2.getCardId()+"입니다.");
		
		System.out.println(card3.getUserName()+"의 카드번호는 "+card3.getCardId()+"입니다.");
		System.out.println(card4.getUserName()+"의 카드번호는 "+card4.getCardId()+"입니다.");
		//싱글톤 패턴에서 여러번 참조됐다고 하더라도 생성자는 초기에 한번 생성된 후 초기화되지 않으므로 카드번호는 101로 일정
		//카드번호를 증가시키려면 싱글톤패턴 내부에서 소스코드 추가
	}
}
