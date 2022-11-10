int cse_test(int a, int b) {
    int result;
    for (int i = 0; i < a; i++) {
        result = result + b;
        if (i > b / 2) {
            break;
        }
    }
    return result;
}

int main() {
    int a = 2;
    int b = 3;
    return cse_test(a, b);
}
