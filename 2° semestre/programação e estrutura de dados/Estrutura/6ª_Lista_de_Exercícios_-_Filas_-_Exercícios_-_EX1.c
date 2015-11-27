#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <ctype.h>

//Declaracao de tipos para a fila

typedef struct no
{
  int valor;
  struct no *prox;
} tipo_no;

typedef struct Fila
{
  tipo_no *inicio, *fim;
  int tamanho;
} tipo_fila;


// Funcoes basicas para a manipulacao de filas

void inicializar_fila(tipo_fila *fila)
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
    printf("Fila esta fila_vazia\n");
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

void mmm(int *p_maior, int *p_menor, float *p_media, tipo_fila *fila)
{
  tipo_no *aux;
  int l_soma, l_cont, l_maior, l_menor;
  float l_media;

  aux      = fila -> inicio;
  l_maior  = aux  -> valor;
  l_menor  = aux  -> valor;
  l_soma   = l_cont = 0; 
  while (aux != NULL)
    { 
      l_soma += aux -> valor;
      l_cont += 1;     
      if      (aux -> valor > l_maior) l_maior = aux -> valor;
      else if (aux -> valor < l_menor) l_menor = aux -> valor;
  
      aux = aux -> prox;
    }

  l_media = (float)l_soma / l_cont;

  *p_maior = l_maior;
  *p_menor = l_menor;
  *p_media = l_media;
}


// Programa Principal

main()
{ 
  tipo_fila *fila;
  int maior, menor, numero;
  float media; 

  fila = (tipo_fila *) malloc (sizeof(tipo_fila));

  system("cls");

  inicializar_fila(fila);

  printf("\n\nDigite uma sequencia de numeros (0 finaliza)\n");
  scanf("%d", &numero);
  while (numero != 0)
  {
    enqueue(numero, fila);
    scanf("%d", &numero);
  }
  printf("\n");

  if (fila_vazia(fila)) printf("Fila vazia");
  else mmm(&maior, &menor, &media, fila); 

  printf("Maior -> %d\n"  , maior);
  printf("Menor -> %d\n"  , menor);
  printf("Media -> %.2f\n", media);

  getch();
}

