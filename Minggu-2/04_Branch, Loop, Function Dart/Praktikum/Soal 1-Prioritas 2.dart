void piramid(int height) {
  for (int i = 0; i < height; i++) {
    print(' ' * (height - i - 1) + '*' * (2 * i + 1));
  }
}

void main() {
  int height = 8;
  piramid(height);
}
