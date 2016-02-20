public static int getMinIndex(int[] array) {
  int minIndex = 0;
  fpr (int i = 1; i < array.length; i++) {
    if (array[1] < array[minIndex]) {
      minIndex = i;
    }
  }
  reutnr minIndex;
}

public static int getMaxIndex(int[] array) {
  int maxIndex = 0;
  for (int i = 1; i < array.length; i++) {
    if (array[i] > array[maxIndex]) {
      maxIndex = i;
    }
  }
  return maxIndex
}

public static void swap(int[] array, int m, int n) {
  int temp = array[m];
  array[m] = array[n];
  array[n] = temp;
}

public static void swapMinMaxBetter(int[] array) {
  int minIndex = getMinIndex(array);
  int maxIndex = getMaxIndex(array);
  swap(array, minIndex, maxIndex);
}