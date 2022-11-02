// Result: 1230
//int gl = 0;

struct blah {
  int a;
  int b;
  int c;
};

//int countto (int n) {
//  int r = 0;
//  for (int i = 0; i < n; i++) {
//    r += i;
//  }
//  return r;
//}

int main () {
  int a[] = new(int[50]);
  blah x = new(blah);
  x.a = 5;
  int r = x.a;
  for (int i = 0; i < 50; i++) {
    a[i] = i;
  }
  for (int i = 0; i < 50; i++) {
    r += a[i];
  }
  return r;
}
