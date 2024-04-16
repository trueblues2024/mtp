//Array based implementation of List ADT
#include<stdio.h>
#define MAX 60
struct node{
    int data;
}s[MAX];
int top=-1;
void insert(int);
void display();
void deletedata(int);
void modify(int, int);
int main(){
    insert(98);
    insert(8);
    insert(9);
    insert(47);
    insert(86);
    insert(20);
    display();
    deletedata(47);
    display();
    modify(55,100);
    display();
    modify(9,100);
    display();
}
//Algorithm for insertion
void insert(int d){
    if(top==MAX-1){
        printf("\nSorry List is full");
        return;
    }
    ++top;
    s[top].data=d;
}
//Algorithm for traversal / display
void display(){
    int i;
    if(top==-1){
        printf("\nSorry List is Empty");
        return;
    }
    printf("\nThe list contents are:");
    for(i=0;i<=top;i++)
        printf("%d-->",s[i].data);
}
//Algorithm for deletion
void deletedata(int d){
    int i;
    if(top==-1){
        printf("\nSorry List is Empty");
        return;
    }
    for(i=0;i<=top;i++)
        if(s[i].data==d){
            while(i<top){
                s[i]=s[i+1];
                i++;
        }
        --top;
    }    
}
//Algorithm for modify / change value
void modify(int oldval,int newval){
    int i;
    if(top==-1){
        printf("\nSorry List is Empty");
        return;
    }
    for(i=0;i<=top;i++)
        if(s[i].data==oldval){
            s[i].data=newval;
            return;
        }
    printf("\nSorry the old value u look for is not found");        
}
