#include <stdbool.h> 
#include <stdio.h>
bool isBalanced(char exp[])
{
    bool flag = true;
    int count = 0;
    for (int i = 0; exp[i] != '\0'; i++) {
 
        if (exp[i] == '(') {
            count++;
        }
        else {
            count--;
        }
        if (count < 0) {
            flag = false;
            break;
        }
    }
    if (count != 0) {
        flag = false;
    }
    return flag;
}
int main()
{
    char exp1[] = "((()))()()";
    if (isBalanced(exp1))
        printf("Balanced \n");
    else
        printf("Not");
    char exp2[] = "())((())";
    if (isBalanced(exp2))
        printf("Balanced \n");
    else
        printf("Not Balanced \n");
    return 0;
}
