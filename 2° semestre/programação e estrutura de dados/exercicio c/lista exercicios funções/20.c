#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (int *num)
{
    char esc[15];
    if ((*num % 2) == 0) printf ("Numero Par");
    else printf ("Numero Impar");
}

main()

{
  int num=0;
  printf ("Informe o numero a ser analizado\n");
  scanf  ("%d",&num);
  func (&num);
  getch();
}
