// Result: 5
int cse_test(int a, int b) {
    int c = a + b;
    int d = a + b;
    return d;

}
int main() {
    int a = 2;
    int b = 3;
    return cse_test(a, b);
}
