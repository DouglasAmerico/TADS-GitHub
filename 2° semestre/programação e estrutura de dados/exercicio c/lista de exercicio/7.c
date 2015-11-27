

#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

main()

{
    printf ("Informe o seu salario\n");
    int salario = 0;
    float reaj=0;

    scanf  ("%d",&salario);

    if (salario < 500)  reaj= salario + (salario/100*15);
    else if (salario <= 1000)  reaj = salario + (salario/100*10);
    else if (salario > 1000)  reaj =  salario + (salario/100*5);

    printf ("O novo salario será de %.2f ",reaj);

    getch();
 }
