
#include <stdio.h>

int fizzbuzz(int from, int to, int fizz, int buzz) {
    if (from > to) {
        return 1;
    }
    int i;
    for (i = from; i <= to; i++) {
        if (0 == i % fizz && 0 == i % buzz) {
            puts("FizzBuzz");
        } else if (0 == i % fizz) {
            puts("Fizz");
        } else if (0 == i % buzz) {
            puts("Buzz");
        } else {
            printf("%d\n", i);
        }
    }
}

int main() {
   return fizzbuzz(1, 50, 3, 5);
}
