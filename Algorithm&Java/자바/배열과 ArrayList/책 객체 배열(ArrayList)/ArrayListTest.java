package javastudy;

import java.util.ArrayList;

public class ArrayListTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Book> alist = new ArrayList<Book>();
		
		Book book = new Book("태백산맥","조동래");
		Book book2 = new Book("토지","박경래");
		Book book3 = new Book("어린왕자","생택쥐페리");
		Book book4 = new Book("데미안","헤르만헤세");
		
		alist.add(book);
		alist.add(book2);
		alist.add(book3);
		alist.add(book4);
		
		//일반 for문
		for(int i=0;i<alist.size();i++) 
			System.out.println(alist.get(i).bookName);
		
		//향상된 for문
		for(Book b:alist)
			System.out.println(b.bookName);
	}
}
