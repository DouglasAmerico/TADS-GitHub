#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define lin 2
#define col 5

void func (float a[lin][col],int linha,int coluna)
{
    int cont=0,cont2=0,maior=0;
    for (cont=0;cont < linha;cont++)
    {
        if (a[cont][cont] > maior) {maior= a[cont][cont];}
    }

    for (cont=0;cont < linha;cont++)
    {
        for (cont2=0;cont2 < coluna;cont2++)
        {
            a[cont][cont2] = a[cont][cont2] / maior;
        }
    }
}

main()
{
    int cont=0,cont2=0;
    float a[lin][col];
    for (cont=0;cont < lin;cont++)
    {
        for (cont2=0;cont2 < col;cont2++)
        {
            printf ("Informe o valor da linha %d coluna %d\n",cont+1,cont2+1);
            scanf  ("%f",&a[cont][cont2]);
        };
        system ("cls");
    };
    func (a,lin,col);

    for (cont=0;cont < lin;cont++)
    {
        for (cont2=0;cont2 < col;cont2++)
        {
            printf ("Nova Matriz linha %d coluna %d = %.2f\n",cont+1,cont2+1,a[cont][cont2]);
        }
    }
}
