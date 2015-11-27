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

int valida_expressao(tipopilha *p, char p_expressao[50])
{
  int w_flag_sem_erro = 1;
  int cont            = 0;
  while ((w_flag_sem_erro) & (cont < strlen(p_expressao)))
  {
    if      (p_expressao[cont] == '(') push(p, '(');
    else if (p_expressao[cont] == ')')
    {
      if (!pilha_vazia(p)) pop(p); else w_flag_sem_erro = 0;
    } 
    ++cont;
  }

  if (!pilha_vazia(p)) w_flag_sem_erro = 0;

  return(w_flag_sem_erro);
}


// -----------------------------
// Programa Principal
// -----------------------------

main()
{
  char expr[50];
  tipopilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite a expressao a ser validada\n");
  scanf("%s", &expr);

  int expressao_correta = valida_expressao(pilha, expr);

  if (expressao_correta) printf("\n\n Expressao VALIDA");
  else printf("\n\n Expressao INVALIDA");

  getch();
}
