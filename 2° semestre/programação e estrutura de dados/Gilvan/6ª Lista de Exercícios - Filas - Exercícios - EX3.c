#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>

// Declaracao de tipos para a fila

typedef struct No
{
  int valor;
  struct No *prox;
} tipo_no;

typedef struct Fila
{
  tipo_no *inicio, *fim;
  int tamanho;
} tipo_fila;


// Funcoes basicas para a manipulacao de filas

void inicilizar_fila(tipo_fila *fila)
{
  fila -> inicio  = NULL;
  fila -> fim     = NULL;
  fila -> tamanho = 0;
  printf("Fila Inicializada");
}  

int fila_vazia(tipo_fila *fila)
{
  return (fila->inicio == NULL);
}  

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

int dequeue(tipo_fila *fila)
{
  tipo_no *q; int v;
  if (fila_vazia(fila))
  { 
    printf("Fila esta vazia\n");
    return 0;
  }
  q = fila -> inicio;
  v = fila -> inicio -> valor;
  fila -> inicio = fila -> inicio -> prox;
  free(q);
  fila -> tamanho--;
  return v;
}  

int tamanho(tipo_fila *fila)
{
  return (fila -> tamanho);
} 

void imprimir_fila(tipo_fila *fila)
{
  tipo_no *aux;
  aux = fila -> inicio;
  while (aux != NULL)
    { 
      printf("%i\n", aux -> valor);
      aux = aux -> prox;
    }
}


void inserir_ordenado(int p_valor, tipo_fila *fila)
{
  tipo_no *atual, *anterior, *aux;

  if (fila_vazia(fila)) enqueue(p_valor, fila);
  else 
  {
    if (p_valor < fila -> inicio -> valor)
    {
      aux            = (tipo_no *) malloc(sizeof(tipo_no));
      aux -> valor   = p_valor;
      aux -> prox    = fila -> inicio;
      fila -> inicio = aux;
    }
    else
    {
      atual    = fila -> inicio;
      anterior = atual;
      while ((atual -> valor < p_valor) & (atual != NULL))
      { 
        anterior = atual;
        atual    = atual -> prox;
      }

      aux              = (tipo_no *) malloc(sizeof(tipo_no));
      aux -> valor     = p_valor;
      anterior -> prox = aux;
      aux -> prox      = atual;
    }

    fila -> tamanho++;
  }
}  


// Programa Principal

main()
{ 
  tipo_fila *fila;
  int numero;

  fila = (tipo_fila *) malloc (sizeof(tipo_fila));

  inicilizar_fila(fila);

  printf("\n\nDigite uma sequencia de numeros (0 finaliza)\n");
  scanf("%d", &numero);
  while (numero != 0)
  {
    inserir_ordenado(numero, fila);
    scanf("%d", &numero);
  }
  printf("\n");

  if (fila_vazia(fila)) printf("Fila Vazia");
  else imprimir_fila(fila); 

  getch();
}

