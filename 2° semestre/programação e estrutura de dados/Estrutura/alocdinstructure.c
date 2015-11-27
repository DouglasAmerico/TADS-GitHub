#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct pessoa
{
char nome[10];
int idade;
float altura;
float peso;
};

void alocdinstruct() {
    struct pessoa *a;
    a =(struct pessoa*)malloc(sizeof(struct pessoa));
    strcpy(a -> nome, "TED");
    a -> idade = 30;
    a -> altura = 1.80;
    a -> peso = 85.7;
    printf ("NOME...%s\n",a -> nome);
    printf ("IDADE...%d\n",a -> idade);
    printf ("ALTURA...%f\n",a -> altura);
    printf ("PESO...%f\n",a -> peso);
}
main(){
alocdinstruct();
}
