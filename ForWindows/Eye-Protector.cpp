#include <stdio.h>
#include <time.h>
#include <windows.h>
using namespace std;
int main() {
  for (int i = 1; true; ++i) {
    Sleep((20 * 60 - 30) * CLOCKS_PER_SEC); // It has seconds delay (here is for 30 seconds).
    time_t a = clock();
    while (clock() - a < 25 * CLOCKS_PER_SEC) {
      system("%systemroot%\\system32\\scrnsave.scr /s");
    }
    printf("Have done %d row%s, which means you have use the computer for %d minutes.\n", i, (i > 0 ? "s" : ""), i * 20);
  }
  return 0;
}
