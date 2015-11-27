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


// -----------------------------
// Sub-Rotinas
// -----------------------------

// -----------------------------
// Criar Pilha
// -----------------------------

tipo_pilha *criar()
{
  tipo_pilha *p;
  p = (tipo_pilha *) malloc(sizeof(tipo_pilha));
  p -> topo = NULL;
  return p;
}


// -----------------------------
// Testar se Pilha esta Vazia
// -----------------------------

int pilha_vazia(tipo_pilha *p)
{
  return(p -> topo == NULL);
}


// -----------------------------
// Empilhar
// -----------------------------

void push(tipo_pilha *p, char x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}





// -----------------------------
// Imprimir Pilha
// -----------------------------


void imprimir_pilha(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    printf("%c\n", aux -> info);
    aux = aux -> prox;
  }
}


// -----------------------------
// Programa Principal
// -----------------------------

main()
{
  char frase[100];
  tipo_pilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite uma frase\n");
  gets(frase);
  int i=0;
  for (i;i<=(strlen(frase-1));i++){
    push(pilha,frase[i]);
  }
  printf("\n");
  imprimir_pilha(pilha);
  getch();
}
