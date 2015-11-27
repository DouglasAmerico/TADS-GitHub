#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define n 5

float func (float x[],int tam,float *soma)
{
    int cont;
    for (cont=0;cont< tam;cont++)
    {
      *soma= *soma + x[cont];
    }
}

main()
{
  int cont=0;
  float x[n],soma=0;
  for (cont=0;cont<n;cont++)
  {
  printf ("Informe o valor da posição %d\n",cont+1);
  scanf  ("%f",&x[cont]);
  }
  func (x,n,&soma);
  printf ("A soma dos elementos de x é %2.f",soma);
  getch();
}
