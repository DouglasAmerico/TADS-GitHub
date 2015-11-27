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

void push(tipopilha *p, char x)
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

int conta_letras_as(tipopilha *p)
{
  tipono *aux = p -> topo;
  int cont_as = 0;
  while (aux != NULL)
  {
    if (aux -> info == 'A') cont_as += 1;
    aux = aux -> prox;
  }
  return cont_as;
}

main()
{
  char letra;
  int  num_as;
  tipopilha *ponteiro;
  ponteiro = criar();
  
  fflush(stdin);
  printf("Digite uma letra (X finaliza)\n");
  scanf("%c", &letra);
  letra = toupper(letra);
  while (letra != 'X')
  {
    push(ponteiro, letra);
    fflush(stdin);
    printf("Digite uma letra (X finaliza)\n");
    scanf("%c", &letra);
    letra = toupper(letra);
  }
  printf("\n");
  num_as = conta_letras_as(ponteiro);
  printf("Quantidade de letras As -> %d", num_as);

  getch();
}






