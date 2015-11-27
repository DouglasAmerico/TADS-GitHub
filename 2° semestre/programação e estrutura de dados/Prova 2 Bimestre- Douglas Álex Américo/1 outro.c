#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

typedef struct no
{
   char info;
   struct no *prox;
} tipo_no;

typedef struct pilha
{
   tipo_no *topo;
} tipo_pilha;
//-------------------------------------------------------------------------------------

tipo_pilha *criar()
{
  tipo_pilha *p;
  p = (tipo_pilha *) malloc(sizeof(tipo_pilha));
  p -> topo = NULL;
  return p;
}
//------------------------------------------------------------------------------------------
 void verificacao(char frase[50],char frase2[50])
 {
     if (strcmp(frase,frase2)== 0)
     {
       printf ("A frase é Palindroma\n");
     }
    else {
          printf ("A frase não é Palindoma\n");
         }
    getch();
 }
//------------------------------------------------------------------------------------------
void push(tipo_pilha *p, char x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}
// -----------------------------------------------------------------------------------------
void imprimir_pilha(tipo_pilha *p,char frase2[50])
{
  int cont=0;
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    //printf("%c-", aux -> info);
    frase2[cont]= aux -> info;
    aux = aux -> prox;
    ++cont;
  }
}
//------------------------------------------------------------------------------------------
main()
{
  char frase[50],frase2[50];
  int pos;
  tipo_pilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite uma frase\n");
  gets(frase);

  for (pos = 0; pos <= strlen(frase) - 1; ++pos)
  {
    push(pilha, frase[pos]);
  }


  printf("\n");
  imprimir_pilha(pilha,frase2);

  verificacao(frase,frase2);

}
