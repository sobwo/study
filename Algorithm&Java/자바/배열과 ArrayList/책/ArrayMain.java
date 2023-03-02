package javaStudy;

public class ArrayMain {

	public static void main(String[] args) {
	 /*
		//배열선언
		//숫자형 배열
		int[] a= new int[10];
		 //배열생성 
		System.out.println(a);
	/*  a[0]=1;
		a[1]=2;
		a[2]=3;
		a[3]=4;
		a[4]=5;
		a[5]=6;
		a[6]=7;
		a[7]=8;
		a[8]=9;
		a[9]=10;
		
		for(int i=0;i<10;i++) {
			a[i]=i+1;
		}
		//초기화
		int[]aa= new int[] {1,2,3,4,5,6,7,8,9,10};
		
		int[]aaa= {1,2,3,4,5,6,7,8,9,10};
		
		int sum=0;
		for(int i=0;i<aaa.length;i++) {
			sum=sum+aaa[i];
			//System.out.println(aaa[i]);
		}
		System.out.println("배열의 합"+sum);
		
		
		
		*/
		
		Book[] library =new Book[3];
		library[0]=new Book("태백산맥","조정래");
		library[1]=new Book("데미안","헤르만헤세");
		library[2]=new Book("토지","박경리");
		//첫번째 book 객체의 책 이름을 알려주세요
		
		
		
		String bn=library[0].bookName;
		System.out.println("책이름"+bn);
		
		
		//배열에 담겨 있는 모든 책의 저자를 출력(반복문)
	
		
		for(int i=0;i<library.length; i++) {
			String name=library[i].author;
		
			System.out.println((i+1)+"번째 저자는"+name);
		}
		//객체반복시 향상된 for문
		for(Book bk:library) {
		System.out.println(bk.author);   
		
		}
		
		
		
		
		
	}
	

}
