int square(int a) {
    return a * a;
}

int main() {
    int a = 2;
    int b = square(a);
    int c = square(b);
    return b + c;
}
