#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
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




//-------------------------------------------------------------------------------------------------------------
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



//------------------------------------------------------------------------------------------------------------
void push(tipo_pilha *p, char x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}



//------------------------------------------------------------------------------------------------------------
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



//------------------------------------------------------------------------------------------------------------
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



//------------------------------------------------------------------------------------------------------------
void imprimir_pilha(tipo_pilha *p)
{
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    printf("%c\n", aux -> info);
    aux = aux -> prox;
  }
}




//---------------------------------------------------------------------------------------------------------
main()
{
  char frase[100];
  tipo_pilha *pilha;
  system("cls");
  pilha = criar();
  printf("Digite uma frase sem espacos: ");
  fflush(stdin);
  gets(frase);
  int tamanho=strlen(frase)-1,i=0,f=tamanho;

  puts(frase);
  i=0;
  for (i;i<tamanho;i++){
    push(pilha,frase[i]);
    if (frase[f]==frase[i]){
        pop(pilha);
        f--;
    }
  }
 if (pilha_vazia(pilha)){
    puts("Frase Palindroma");
 }
 else{
    puts("Frase não Palindroma");
 }

  getch();
}

