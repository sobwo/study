package javastudy;

public class Card_Singleton {
	private static Card_Singleton instance;
	private static int cardNum = 100;
	private int cardId;
	private String userName;
	
	public Card_Singleton(){
		cardId = cardNum;
	}
	
	public static Card_Singleton getInstance() {
		if(instance == null) instance = new Card_Singleton();
		instance.cardId++;
		return instance;
	}
	
	public int getCardId() {
		return cardId;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
