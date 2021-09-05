#include <bits/stdc++.h>
using namespace std;
using namespace std::chrono;
int main() {
  steady_clock::time_point t1, t2;
  duration<double> dur;
  for (long long i = 1; true; ++i) {
    system("sleep 20m");
    t1 = steady_clock::now();
    do {
      t2 = steady_clock::now();
      dur = duration_cast<duration<double>>(t2 - t1);
      system("xset dpms force off");
    } while (dur.count() < 28);
  }
  return 0;
}
