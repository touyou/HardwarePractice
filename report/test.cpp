#include <bits/stdc++.h>
using namespace std;
typedef pair<int, int> P;
vector<P> li;

int collatz(int n) {
    int res = 0;
    while (n > 1) {
        n = n%2==0 ? n / 2 : n * 3 + 1;
        res++;
    }
    return res;
}

int main() {
    for (int i=0; i<256; i++) {
        int temp = collatz(i);
        li.push_back(P(temp, i));
    }
    sort(li.begin(), li.end());
    reverse(li.begin(), li.end());
    for (int i=0; i<20; i++) {
        printf("%d count: %d, number: %d\n", i, li[i].first, li[i].second);
    }
}
