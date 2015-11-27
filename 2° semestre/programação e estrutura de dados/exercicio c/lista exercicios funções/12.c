#include<stdio.h>
#include<conio.h>

int func (int a,int b)
{
    int soma=0,cont=0;
    for (cont= a;cont <= b;cont++)
    {
      soma= soma + cont;
    };
    return soma;
};

main()
{
    printf ("INforme os 2 numeros de intervalo\n");
    int n1=0,n2=0;
    scanf  ("%d",&n1);
    scanf  ("%d",&n2);

    printf ("A soma dos numeros no intervalo de %d e %d é %d",n1,n2,func(n1,n2));
    getch();
}
