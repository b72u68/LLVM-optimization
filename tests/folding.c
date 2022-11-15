// Result: 9
int folding(int a) {
    int temp = a;

    int a1 = (temp = temp + 1) * 0;
    int a2 = 0 * (temp = temp + 1);

    if (3 > 4 && (temp = temp + 1) < 5) {
        temp = temp + 1;
    }

    if ((temp = temp + 1) < 6 && 3 > 5) {
        temp = temp + 1;
    }

    if ((1 + 1 == 2) || ((temp = temp + 1) < 7)) {
        temp = temp + a1;
    }

    if (((temp = temp + 1) < 8) || (1 + 1 == 2)) {
        temp = temp + a2;
    }

    return temp + a1 + a2;
}

int main() {
    return folding(5);
}
