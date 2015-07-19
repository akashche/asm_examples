
#include <stdlib.h>
#include <sys/mman.h>

int main() {
    return mmap(NULL, 8, PROT_READ | PROT_WRITE | PROT_EXEC,
            MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
}
