#include <bits/stdc++.h>
using namespace std;
bool checkSpecialPrime(bool* sieve, int num)
{
    while (num) {
        if (!sieve[num]) {
            return false;
        }
        num /= 10;
    }
    return true;
}
void findSpecialPrime(int N)
{
    bool sieve[N*10];
    memset(sieve, true, sizeof(sieve));
    sieve[0] = sieve[1] = false;
    for (long long i = 2; i <= N*10; i++) {
        if (sieve[i]) {
            for (long long j = i * i; j <= N*10; j += i) {
                sieve[j] = false;
            }
        }
    }
    while (true) {
        if (checkSpecialPrime(sieve, N)) {
            cout << N << '\n';
            break;
        }
        else
            N++;
    }
}
int main()
{
    int N = 379;
    findSpecialPrime(N);
    N = 100;
    findSpecialPrime(N);
    return 0;
}
