
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define dim 15

void func(int vet[],int tam,int *x)
{
 int cont2=0;
 for (cont2=0;cont2<tam;cont2++)
 {
   if ((vet[cont2] % 2) == 0)  *x = *x + 1;
 }
};

main()
{
 int vet[dim],cont=0,x=0;

 for (cont=0;cont<dim;cont++)
 {
 printf ("Informe o valor da posição %d \n",cont+1);
 scanf ("%d",&vet[cont]);
 };

 func(vet,dim,&x);

 printf ("Existem %d numeros pares no vetor",x);

 getch();
}

