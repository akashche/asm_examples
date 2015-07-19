
#include <stdio.h>

int main() {
    unsigned char data[16];
    size_t numread, i;

    while ((numread = read(0, data, 16)) > 0) {
        for (i = 0; i < numread; i++) {
            printf("%02x ", data[i]);
            if (7 == i) {
                printf("- ");
            } else if (15 == i) {
                printf("\n");
            }
            
        }
    }

    return 0;
}
