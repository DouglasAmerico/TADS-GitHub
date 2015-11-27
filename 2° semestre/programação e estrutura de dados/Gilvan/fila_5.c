#include <stdio.h>
#include <stdlib.h>

//Declaração de tipos para a fila

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


// Funções basicas para a manipulação de filas

tipo_fila *inicializar_fila(tipo_fila *fila)
{
  fila -> inicio  = NULL;
  fila -> fim     = NULL;
  fila -> tamanho = 0;
  printf("fila Inicializada\n");
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
void copia (tipo_fila *fila, tipo_fila *fila2){
    tipo_no *aux,*aux2;
    aux2 = (tipo_no *) malloc(sizeof(tipo_no));
    aux = fila -> inicio;
    while (aux != NULL){
            aux2 -> valor = aux -> valor;

            aux2 -> prox = NULL;
            if (fila_vazia(fila2)){
                fila2 -> inicio = aux2;
                fila2 -> fim = aux2;
            }else{
            fila2 -> fim -> prox = aux2;
            fila2 -> fim = aux2;
            }
        fila2->tamanho++;
        aux = aux -> prox;
    }
}

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
      printf("%d\n", aux -> valor);
      aux = aux -> prox;
    }
}

// Programa Principal

main()
{
  tipo_fila *fila,*fila2;
  int i, numero=1;

  fila = (tipo_fila *) malloc (sizeof(tipo_fila));
  fila2 = (tipo_fila *) malloc(sizeof(tipo_fila));
  inicializar_fila(fila);
  inicializar_fila(fila2);
  while (numero !=0)
    {
      printf("Leitura do valor : ");
      scanf("%d", &numero);
      enqueue(numero, fila);
    }
 copia(fila,fila2);
  printf("tamanho da fila: %d\n", tamanho(fila));
  printf("tamanho da fila2: %d\n", tamanho(fila2));
  imprimir_fila(fila);
  imprimir_fila(fila2);
  getch();
}

