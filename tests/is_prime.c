// Result: 1
int mod(int a, int b) {
    int result = -1;
    if (b == 0) {
        // `result` should be propagated to -1
        return result;
    }
    while (a >= b) {
        a = a - b;
        // `result` shouldn't be `a` after cse
        result = a - b;
    }
    // `result` should be removed after `result` in return expression is
    // propagated to `a`
    result = a;
    // `result` should be propagated to a
    return result;
}

int square_root(int n) {
    if (n <= 1) {
        return n;
    }
    int i = 1;
    // `i` shouldn't be propagated to 1
    while (i <= n) {
        if (i * i > n) {
            i = i - 1;
            break;
        } else {
            i = i + 1;
            continue;
        }
    }
    return i;
}

int is_prime(int n) {
    if (n <= 1) {
        return 0;
    }
    int sroot = square_root(n);
    int result = 1;
    for (int i = 2; i <= sroot; i++) {
        if (mod(n, i) == 0) {
            result = 0;
            break;
        }
    }
    // This shouldn't be propagated to 0 or 1
    return result;
}

int main() {
    // `padding` should be removed after dead code elimination
    int padding = 10;
    // `n` should be removed after dead code elimination
    int n = 9;
    // `n` should be propagated and folded to 11
    n = n + padding;
    // `n` should be propagated to 11
    int result = is_prime(n);
    // `n` should be propagated to 11, `is_prime(n)` replaced with `result`
    // after cse
    return is_prime(n);
}
