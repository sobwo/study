package javastudy;

public interface Sort {
	public void ascending();
	public void descending();
	public void description();
	default void swap(int[] arr, int i, int j) {
	    int temp = arr[i];
	    arr[i] = arr[j];
	    arr[j] = temp;

	}
}
