#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (int *num)
{ int soma = 0,cont=0;
  do
  {
      cont= cont++;
      if ((*num % cont) == 0) { soma = soma + cont; }
  }
  while (cont == *num);

  if (soma == *num) {*num = 0;}
  else *num = 1;
}

main()
{
    printf ("Informe o numero\n");
    int num=0;
    scanf ("%d",&num);
    int n= num;

   func (&num);
   if (num == 0) printf ("O numero %d não é perfeito",n);
   else printf ("O numero %d é perfeito",n);
   getch();
}
