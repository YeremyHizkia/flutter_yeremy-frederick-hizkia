void main() {
  int A = 10;
  int B = 40;
  int C = 50;

  print("Faktorial dari $A adalah ${Hitung(A)}");
  print("Faktorial dari $B adalah ${Hitung(B)}");
  print("Faktorial dari $C adalah ${Hitung(C)}");
}

int Hitung(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * Hitung(n - 1);
  }
}
