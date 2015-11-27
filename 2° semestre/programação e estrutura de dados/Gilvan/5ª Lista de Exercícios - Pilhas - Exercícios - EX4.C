#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>

typedef struct no
{
   int info;
   struct no *prox;
} tipo_no;

typedef struct pilha
{
   tipo_no *topo;
} tipo_pilha;

tipo_pilha *criar()
{
  tipo_pilha *p;
  p = (tipo_pilha *) malloc(sizeof(tipo_pilha));
  p -> topo = NULL;
  return p;
}

void push(tipo_pilha *p, int x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}

int pilha_vazia(tipo_pilha *p)
{
  return(p -> topo == NULL);
}

int pop(tipo_pilha *p)
{
  int x;
  tipo_no *aux = p -> topo;
  tipo_no *a;
  if (pilha_vazia(p))
  {
    printf("Pilha Vazia");
    exit(1);
  }
  x = p -> topo -> info;
  a = aux -> prox;
  p -> topo = a;
  free(aux);
  printf("Retirou o elemento %d", x);
  return(x);
}

void libera(tipo_pilha *p)
{
  tipo_no *q = p -> topo;
  while (q != NULL)
  {
    tipo_no *t = q -> prox;
    free(q);
    q = t;
  }
  free(p);
}

void imprime_pilha(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    printf("%d\n", aux -> info);
    aux = aux -> prox;
  }
}

void imprime_par(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    if ((aux -> info % 2) == 0) printf("%d\n", aux -> info);
    aux = aux -> prox;
  }
}

main()
{
  int num;
  tipo_pilha *pilha;
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
  imprime_par(pilha);

  getch();
}
