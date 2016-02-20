public int convertBase(String number, int base) {
  if (base < 2 || (base > 10 && base != 16)) return -1;
  int value = 0;
  for (int i = number.length() - 1; i >= 0; i--) {
    int digit = digitalToValue(number.charAt(i));
    if (digit < 0 || digit >= base) {
      return -1;
    }
    int exp = number.length() - 1 - i;
    value += digit * Math.pow(base, exp);
  }
  return value;
}