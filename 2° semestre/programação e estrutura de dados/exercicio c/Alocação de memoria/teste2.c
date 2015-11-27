#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<string.h>

typedef struct
{
    char nome[10];
    int idade;
    float altura;
    float peso;
} pessoa;

void alcostruct()
{
    pessoa *a;
    a= (pessoa*)malloc(sizeof(pessoa));
    strcpy (a -> nome,"TED");
    a-> idade = 30;
    a-> altura= 1,80;
    a-> peso = 85,7;
    printf ("Nome %s\n",a-> nome);
    printf ("Idade %d\n",a-> idade);
    printf ("Altura %2.f\n",a-> altura);
    printf ("Peso %2.f\n",a-> peso);
    getch();
}
main()
{
    alcostruct();
}
