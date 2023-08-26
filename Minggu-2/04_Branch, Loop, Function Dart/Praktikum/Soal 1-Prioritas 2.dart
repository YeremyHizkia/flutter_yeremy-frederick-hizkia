void piramid(int tingkat) {
  for (int i = 0; i < tingkat; i++) {
    print(' ' * (tingkat - i - 1) + '*' * (2 * i + 1));
  }
}

void main() {
  int tingkatan = 8;
  piramid(tingkatan);
}
