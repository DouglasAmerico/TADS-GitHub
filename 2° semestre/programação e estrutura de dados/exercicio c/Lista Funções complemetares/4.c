#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (char frase[],int num)
{
    frase[num]= strupr(frase);
}

main()
{
    printf ("Informe a string\n");
    char frase[10];
    gets (frase);
    func (frase,10);
    printf ("Com a conver��o fica assim '%s' ",frase);
    getch();
}
