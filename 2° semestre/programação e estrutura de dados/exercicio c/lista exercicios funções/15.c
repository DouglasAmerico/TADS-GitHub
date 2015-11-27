#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define n 10

int func (int vet1[],int vet2[],int vet3[],int tam)
{
  int cont=0;
  for (cont=0;cont< tam;cont++)
  {
   vet3[cont]= vet1[cont] + vet2[cont];

  }
}

main()
{
  int vet1[n],vet2[n],vet3[n];
  int cont=0;

  for (cont=0;cont<n;cont++)
 {
   printf ("Informe o %d valor do  vetor 1\n",cont+1);
   scanf  ("%d",&vet1[cont]);
 }
 system ("cls");

 for (cont=0;cont<n;cont++)
 {
   printf ("Informe o %d valor do vetor 2\n",cont+1);
   scanf  ("%d",&vet2[cont]);
 }
 system ("cls");
 func (vet1,vet2,vet3,n);
 system ("cls");

 for (cont=0;cont<n;cont++)
 {
   printf ("União dos vetores posição %d = %d\n",cont+1,vet3[cont]);
   };
   getch();
}
