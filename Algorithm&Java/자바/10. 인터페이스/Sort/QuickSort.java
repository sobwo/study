package javastudy;

public class QuickSort implements Sort {
	private int[] arr;
	public QuickSort(int[] arr) {
		this.arr = arr;
	}
	
	@Override
	public void ascending() {
		System.out.println("QuickSort ascending");
		ascending(this.arr,0,arr.length-1);
		for(int i:this.arr)
			System.out.print(i+" ");
		System.out.println("");

	}
	
	private void ascending(int[] arr, int start, int end) {
		int part = partition(arr,start,end);
		if(start<part-1) ascending(arr,start,part-1);
		if(end>part) ascending(arr,part,end);
	}
	
	private int partition(int[] arr, int start, int end) {
		int pivot = arr[(start+end)/2];
		while(start<=end) {
			while(arr[start]<pivot) start++;
			while(arr[end]>pivot) end--;
			if(start<=end) {
			swap(arr,start,end);
				start++;
				end--;
			}
		}
		this.arr = arr;
		return start;
	}

	@Override
	public void descending() {
		System.out.println("QuickSort descending");

	}

	@Override
	public void description() {
		System.out.println("숫자를 정렬하는 알고리즘입니다.");
		System.out.println("QuickSort입니다.");

	}

}
