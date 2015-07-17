
int fib2(int a) {
    if (0 == a) {
        return 0;
    }
    if (1 == a) {
        return 1;
    }
    int n0 = 0;
    int n1 = 1;
    int i;
    for (i = 0; i < a-2; i++) {
        int t = n0;
        n0 = n1;
        n1 = n0 + t;
    }
    return n0 + n1;
}

int main() {
    return fib2(12);
}
