package javastudy;

public class TakeCafe {
	public static void main(String[] args) {
		CafeUser p1 = new CafeUser("홍길동",10000,"아메리카노");
		CafeUser p2 = new CafeUser("강감찬",20000,"라떼");
		CafeUser p3 = new CafeUser("홍길순",15000,"에스프레소");
		
		CafeByeol cafeByeol = new CafeByeol();
		CafeCong cafeCong = new CafeCong();
		
		p1.takeByeol(cafeByeol);
		p1.showInfo();
		cafeByeol.showInfo();
		
		p2.takeCong(cafeCong);
		p2.showInfo();
		cafeCong.showInfo();
		
		p3.takeByeol(cafeByeol);
		p3.showInfo();
		cafeByeol.showInfo();
	}
}
