package javastudy;

public class Card {
	private static int cardNum = 100;
	private int cardId;
	private String userName;
	
	public Card(){
		cardNum++;
		cardId = cardNum;
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
