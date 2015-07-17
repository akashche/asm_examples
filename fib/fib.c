
int fib(int a) {
    if (0 == a) {
        return 0;
    }
    if (1 == a) {
        return 1;
    }
    return fib(a - 2) + fib(a - 1);
}

int main() {
    return fib(12);
}
