#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

typedef struct noh
{
   char info;
   struct noh *prox;
} tipono;

typedef struct pilha
{
   tipono *topo;
} tipopilha;

tipopilha *criar()
{
  tipopilha *p;
  p = (tipopilha *) malloc(sizeof(tipopilha));
  p -> topo = NULL;
  return p;
}

void push(tipopilha *p,int x)
{
  tipono *aux;
  aux = (tipono *) malloc(sizeof(tipono));
  aux -> info = x;
  aux -> prox = p-> topo;
  p   -> topo = aux;
}

int vazia(tipopilha *p)
{
  return(p -> topo == NULL);
}

int pop(tipopilha *p)
{
  char x;
  tipono *aux = p -> topo;
  tipono *a;
  if (vazia(p))
  {
    printf("Pilhavazia");
    exit(1);
  }
  x = p -> topo -> info;
  a = aux -> prox;
  p -> topo = a;
  free(aux);
  printf("Retirou o elemento %d", x);
  return(x);
}

void libera(tipopilha *p)
{
  tipono *q = p -> topo;
  while (q != NULL)
  {
    tipono *t = q -> prox;
    free(q);
    q = t;
  }
  free(p);
}

void imprime(tipopilha *p)
{
  tipono *aux = p -> topo;
  while (aux != NULL)
  {
    printf("%c\n", aux -> info);
    aux = aux -> prox;
  }
}

int conta_letras_x(tipopilha *p)
{
  tipono *aux = p -> topo;
  int cont_x = 0;
  while (aux != NULL)
  {
    if (aux -> info == 'X') cont_x += 1;
    aux = aux -> prox;
  }
  return cont_x;
}

main()
{
  char palavra[50];
  int pos, num_x;
  tipopilha *ponteiro;
  ponteiro = criar();
  printf("Digite uma palavra\n");
  scanf("%s", &palavra);
  strupr(palavra); 
  for (pos = 0; pos <= strlen(palavra); pos += 1)
  {
    push(ponteiro, palavra[pos]);
  }
  printf("\n");
  imprime(ponteiro);
  printf("\n");
  getch();
  num_x = conta_letras_x(ponteiro);
  printf("Quantidade de letras X -> %d", num_x);

  getch();
}






