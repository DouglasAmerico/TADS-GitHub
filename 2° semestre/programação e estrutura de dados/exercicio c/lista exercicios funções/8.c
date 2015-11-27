
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

int comparacao(int num1,int num2)
{
  int cont= num1,soma=0;
  do
  {
    cont= cont++;
    soma= soma + cont;
  }
  while (cont < (num2-1));

  return soma;
}

main()
{
 int a,b,soma;
 printf ("Informe o menor numero a ser comparado\n");
 scanf  ("%d",&a);
 printf ("informe o maior numerro a ser comparado\n");
 scanf  ("%d",&b);

 printf ("A soma dos numeros entre %d á %d é %d ",a,b,comparacao(a,b));
 getch();

}
