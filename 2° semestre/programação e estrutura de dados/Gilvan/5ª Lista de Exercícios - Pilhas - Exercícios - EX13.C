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


// -----------------------------
// Sub-Rotinas
// -----------------------------

// -----------------------------
// Criar Pilha
// -----------------------------
tipopilha *criar()
{
  tipopilha *p;
  p = (tipopilha *) malloc(sizeof(tipopilha));
  p -> topo = NULL;
  return p;
}

// -----------------------------
// Testar se Pilha esta Vazia
// -----------------------------
int pilha_vazia(tipopilha *p)
{
  return(p -> topo == NULL);
}

// -----------------------------
// Empilhar
// -----------------------------
void push(tipopilha *p, char x)
{
  tipono *aux;
  aux = (tipono *) malloc(sizeof(tipono));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}

// -----------------------------
// Desempilhar
// -----------------------------
char pop(tipopilha *p)
{
  char x;
  tipono *aux = p -> topo;
  tipono *a;
  if (pilha_vazia(p))
  {
    printf("Pilha Vazia");
    exit(1);
  }
  x = p -> topo -> info;
  a = aux -> prox;
  p -> topo = a;
  free(aux);
  printf("Retirou o elemento %c\n", x);
  return(x);
}

// -----------------------------
// Liberar Pilha
// -----------------------------
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

// -----------------------------
// Imprimir Pilha
// -----------------------------
void imprime(tipopilha *p)
{
  tipono *aux = p -> topo;
  while (aux != NULL)
  {
    printf("%d\n", aux -> info);
    aux = aux -> prox;
  }
}

// --------------------------------
// Rotina para Validar Expressao
// --------------------------------
int eh_palindrome(tipopilha *p, char p_frase[50])
{
  int w_flag_eh_palindrome = 0, cont;
  char l_frase[50];
  for (cont = 0; cont <= strlen(p_frase) - 1; ++cont)
  {
    push(p, p_frase[cont]);
  }

  for (cont = 0; cont <= strlen(p_frase) - 1; ++cont)
  {
    l_frase[cont] = pop(p);
  }


  if (p_frase = l_frase) w_flag_eh_palindrome = 1;

  return(w_flag_eh_palindrome);
}


// -----------------------------
// Programa Principal
// -----------------------------
main()
{
  char frase[50];
  tipopilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite a expressao a ser validada\n");
  scanf("%s", &frase);

  int palindrome = eh_palindrome(pilha, frase);

  if (palindrome) printf("\n\n PALINDROME");
  else printf("\n\n NAO PALINDROME");

  getch();
}
