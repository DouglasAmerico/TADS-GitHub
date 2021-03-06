#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

typedef struct no
{
  int valor;
  struct no *prox;
} tipo_no;

typedef struct fila
{
  tipo_no *inicio, *fim;
  int tamanho;
} tipo_fila;

//---------------------------------------------------

int fila_vazia(tipo_fila *fila)
{
  return (fila->inicio == NULL);
}

//---------------------------------------------------
tipo_fila *inicializar_fila(tipo_fila *fila)
{
  fila -> inicio  = NULL;
  fila -> fim     = NULL;
  fila -> tamanho = 0;
  printf("Incialização realizada com sucesso!\n");
}
//---------------------------------------------------

void enqueue(int x, tipo_fila *fila)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> valor = x;
  aux -> prox  = NULL;
  if (fila_vazia(fila))
  {
    fila -> inicio = aux;
    fila -> fim    = aux;
  }
  else
  {
    fila -> fim -> prox = aux;
    fila -> fim = aux;
  }
  fila -> tamanho++;
}

//---------------------------------------------------

int dequeue(tipo_fila *fila)
{
  tipo_no *q; int v;
  if (fila_vazia(fila))
  {
    printf("fila esta vazia\n");
    return 0;
  }
  q = fila -> inicio;
  v = fila -> inicio -> valor;
  fila -> inicio = fila -> inicio -> prox;
  free(q);
  fila -> tamanho--;
  return v;
}

//---------------------------------------------------
main()
{
  tipo_fila *fila;
  int i, numero;

  fila = (tipo_fila *) malloc (sizeof(tipo_fila));

  inicializar_fila(fila);

  for (i = 0; i < 5; i++)
    {
      printf("Leitura do valor (%d) : ", i + 1);
      scanf("%d", &numero);
      enqueue(numero, fila);
      printf("Enfileirou: %d \n", numero);
    }




}
