#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (char frase[10],int *soma)
{
  int cont=0;
  for (cont=0;cont<10;cont++)
  {
    if (frase[cont] == 'A' || frase[cont] == 'E' || frase[cont] == 'I' || frase[cont] == 'O' || frase[cont] == 'U') {*soma= *soma +1;}
  }
}

main()
{
    printf ("Informe a string\n");
    char frase[10];
    int soma=0;
    gets  (frase);
    strupr(frase);

    func (frase,&soma);
    printf ("Existem %d vogais na string\n",soma);
    getch();
}
