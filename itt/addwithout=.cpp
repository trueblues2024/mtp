#include <iostream>
using namespace std;

int add(int a, int b)
{
	for (int i = 1; i <= b; i++)
		a++;
	return a;
}

int main()
{
	int a = add(70, 32);
	cout << a;
	return 0;
}
