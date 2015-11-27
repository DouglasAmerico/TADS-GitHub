#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define n 10

void func(char frase[n])
{
    int cont=0;
    char x[n];
    //x[n]= frase[n];
    //printf ("Teste = %s\n",x);

    for (cont=0;cont< n/2;cont++)
    {
      x[cont]= frase [cont];
      frase[cont]= frase[n - cont - 1];
      frase[n - cont -1 ]= x[cont];
    }
}

 main()
 {
     printf ("Informe a frase a ser envertida\n");
     char frase[n];
     scanf ("%s",&frase);
     func (frase);
     int cont=0;

     for (cont=0;cont<n;cont++)
     if (frase[cont] != ' ') {printf ("%c",frase[cont]);}
     getch();
 }
