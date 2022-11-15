int test(int a, int b) {
    int result;
    if (a + b > 4) {
        result = 1;
    } else {
        result = 2;
    }
    return result;
}

int main() {
    int a = 2;
    int b = 3;
    return test(a, b);
}
