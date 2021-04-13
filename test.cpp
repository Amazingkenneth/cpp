#include <bits/stdc++.h>
const int Maxn = 31622776 + 5;
using namespace std;
int n, _;
vector<int> prime;
long long need;
bool np[Maxn];
void gen_prime(int Max) {
  np[1] = true;
  for (int i = 2; i <= Max; ++i) {
    if (!np[i]) {
      prime.push_back(i);
    }
    for (int j = 0; j < prime.size(); ++j) {
      int now = i * prime[j];
      if (now > Max) break;
      np[now] = true;
      if (i % prime[j] == 0) break;
    }
  }
}
int main() {
  scanf("%d", &_);
  gen_prime(Maxn - 4);
//  for (int i = 1; i < 1000; ++i)
//    printf("%d : %d\n", i, np[i]);
  for (int t = 1; t <= _; ++t) {
    scanf("%lld", &need);
    printf("Case #%d:\n", t);
    if (need < Maxn - 5 && !np[need]) {
      printf("%lld 1\n", need);
      continue;
    }
    for (int i = 2, sq = sqrt(need), now; i <= sq && need > 1; ++i) {
      if (!np[i]) {
        for (now = 0; need % i == 0 && need > 1; ++now, need /= i) {}
        if (now > 0)
          printf("%d %d\n", i, now);
      }
    }
    if (need > 1)
      printf("%lld 1\n", need);
  }
  return 0;
}