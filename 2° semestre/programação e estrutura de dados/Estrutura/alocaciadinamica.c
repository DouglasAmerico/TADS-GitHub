#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

void alocdin2(){
int *a;
int n,i;
puts("Informe o numero de elementos a serem lidos: ");
scanf("%d",&n);
a = (int *)malloc(n* sizeof(int));
if (a=NULL){
    puts("Erro de alocacao de memoria \n");
    system("PAUSE");
    exit(0);
}
for (i=0;i<n;i++){
    scanf("%d",a++);
}
puts("");
for (i=0;i<n;i++){
printf("%d",a[i]);
}
getch();
}
main (){
alocdin2();
}
