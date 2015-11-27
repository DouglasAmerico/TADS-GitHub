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
  tipo_fila *fila_impar, *fila_par;
  int numero;

  fila_par   = (tipo_fila *) malloc (sizeof(tipo_fila));
  fila_impar = (tipo_fila *) malloc (sizeof(tipo_fila));

  inicializar_fila(fila_par);
  inicializar_fila(fila_impar);
  
  printf("\n\nDigite uma sequencia de numeros (0 finaliza)\n");
  scanf("%d", &numero);
  while (numero != 0)
  {
    if (numero % 2 == 0) enqueue(numero, fila_par);
    else enqueue(numero, fila_impar);
    
    scanf("%d", &numero);
  }
  
  printf("\n");
  printf("Elementos da fila impar\n");
  imprimir_fila(fila_impar);
  
  printf("\n");
  printf("Elementos da fila par\n");
  imprimir_fila(fila_par);
  
  printf("\n");
  
  
  while ((fila_par -> inicio != NULL) || (fila_impar -> inicio != NULL))
  {
     if (!fila_vazia(fila_impar))
     {
        numero = dequeue(fila_impar);
        printf("Retirado o numero %d da fila impar\n", numero);
     }
     
     if (!fila_vazia(fila_par))
     {
        numero = dequeue(fila_par);
        printf("Retirado o numero %d da fila par\n", numero);
     }
  }  
  
  printf("\ntamanho da fila impar: %d\n", tamanho(fila_impar));
  printf("\ntamanho da fila par..: %d\n", tamanho(fila_par));
  
  getch();
}

