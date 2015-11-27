#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define l 7
#define c 6

void func (int matriz[l][c],int *soma1,int *soma2)
{
  int lin=0,col=0;
  for (lin=4;lin==4;lin++)
   for (col=0;col<6;col++)
   {
     *soma1= *soma1 + matriz[lin][col];
   }

  for (lin=0;lin<7;lin++)
   for (col=2;col==2;col++)
   {
     *soma2= *soma2 + matriz[lin][col];
   }
}
main()
{
 int linha=0,coluna=0,soma1=0,soma2=0;
 int matriz[l][c];
 for (linha=0;linha<l;linha++)
 { for (coluna=0;coluna<c;coluna++)
   {
     printf ("Informe o valor da linha %d da coluna %d\n",linha+1,coluna+1);
     scanf  ("%d",&matriz[linha][coluna]);
   };
   system ("cls");
  };
 func (matriz,&soma1,&soma2);

 printf ("A soma dos eelementos da linha 5 é %d e da coluna 3 é %d",soma1,soma2);
 getch();
}
