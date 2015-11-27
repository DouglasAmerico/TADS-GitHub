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
// Desempilhar
// -----------------------------

int pop(tipo_pilha *p)
{
  int x;
  tipo_no *aux = p -> topo;
  if (pilha_vazia(p))
  {
    printf("Pilha Vazia");
    exit(1);
  }
  x = p -> topo -> info;
  p -> topo = aux -> prox;
  free(aux);
  return(x);
}

// -----------------------------
// Liberar Pilha
// -----------------------------

void liberar_pilha(tipo_pilha *p)
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
  char expressao[100];
  tipo_pilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite uma frase:\n");
  gets(expressao);
  int tamanho=strlen(expressao)-1,i=0;
  for (i;i<=tamanho;i++){
        if(expressao[i]=='('){
            push(pilha,expressao[i]);
        }
        else if((expressao[i]==')')& !(pilha_vazia(pilha))){
            pop(pilha);
        }
      }
 if (pilha_vazia(pilha)){
    puts("EXPRESSAO CORRETA");
 }
 else{
    puts("EXPRESSAO INCORRETA LEK");
 }


  getch();
}
