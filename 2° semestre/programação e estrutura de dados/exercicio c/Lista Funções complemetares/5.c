#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (char a[10],char b[10], char c[20])
{
    int cont=0,cont2= -1;
    for (cont=0;cont<20;cont++)
    {
        while ((cont2 % 2) == 0)
        {
        cont2= cont2 + 1;
        c[cont2]= a[cont];
        printf ("%c\n",a[cont]);
        cont2= cont2 + 1;
        c[cont2]= b[cont];
        printf ("%c\n",b[cont]);
        }
    }
}

main()
{
 printf ("Informe duas palavra\n");
 char a[10],b[10],c[20];
 gets (a);
 gets (b);
 func (a,b,c);
 printf ("A junção das duas palavras é '%s'",c);
 getch();
}
