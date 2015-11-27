#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

typedef struct no
{
   int info;
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
// Empilhar
// -----------------------------

void push(tipo_pilha *p,char x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}

// -----------------------------

// -----------------------------
// Imprimir Pilha
// -----------------------------

void imprimir_pilha(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
      printf("%d\n", aux -> info);
      aux = aux -> prox;
  }
}
// pares imprimir


void imprimir_pilha_par(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    if ((aux-> info % 2)== 0)
    {
      printf("%d\n", aux -> info);}
      aux = aux -> prox;
  }
}

// -----------------------------
// Programa Principal
// -----------------------------

main()
{
  int num;
  tipo_pilha *pilha;
  //system("cls");
  pilha = criar();
  printf("Digite um numero (0 finaliza)\n");
  scanf("%d", &num);
  while (num != 0)
  {
    push(pilha, num);
    printf("Digite um numero (0 finaliza)\n");
    scanf("%d", &num);
  }

  printf("\n");
  imprimir_pilha(pilha);

  getch();

  //printf("\n");
  //pop(pilha);

  printf("\n");
  imprimir_pilha_par(pilha);

  getch();
}
