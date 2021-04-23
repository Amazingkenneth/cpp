#include <bits/stdc++.h>
const int Maxn = 1e5 + 5;
using namespace std;
int n, truth[Maxn], tong[Maxn], sum;
struct stone {
  int num, has;
  bool operator< (const stone comp) const {
    if (has == comp.has)
      return comp.num < num;
    return comp.has > has;
  }
};
struct bigger {
  int num, has;
  bool operator< (const bigger comp) const {
    if (has == comp.has)
      return comp.num > num;
    return comp.has > has;
  }
};
priority_queue<bigger> big;
priority_queue<stone> q;
int main() {
  freopen("d.in", "r", stdin);
  freopen("d.out", "w", stdout);
  scanf("%d", &n);
  for (int i = 0; i < n; ++i) {
    scanf("%d", &truth[i]);
    sum += truth[i];
    q.push((stone){ i, truth[i] });
    big.push((bigger){ i, truth[i] });
  }
  while (sum > 0) {
    if (q.top().has != truth[q.top().num]) {
      stone tmp = q.top();
      tmp.has = truth[q.top().num];
      q.pop();
      q.push(tmp);
      continue;
    }
    ++tong[q.top().num];
    for (; true; ) {
      bigger tmp = big.top();
      if (big.top().has != truth[big.top().num]) {
        tmp.has = truth[big.top().num];
        big.pop();
        big.push(tmp);
        continue;
      }
      --truth[big.top().num];
      --tmp.has;
      big.pop();
      big.push(tmp);
      --sum;
      break;
    }
  }
  for (int i = 0; i < n; ++i)
    printf("%d\n", tong[i]);
  return 0;
}
