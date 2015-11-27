#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

int func (int a)
{
    int cont,soma=0;
    for (cont=1;cont<11;cont++)
    {
     soma = a * cont;
     printf ("\n%d X %d = %d",a,cont,soma);
     soma = 0;
    }
}

main()
{
  int num=0;
  printf ("Informe o numero a ser calculado a taboada\n");
  do
   scanf ("%d",&num);
   //if ((num < 1) || (num > 10) )printf ("Informe o numero novamnete");
  while ((num < 1) || (num > 10));

  func (num);
  getch();
}
