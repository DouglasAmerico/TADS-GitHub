#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
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
//----------------------------------------------------------------------------
main()
{
  tipo_fila *fila_impar, *fila_par;
  int num;

  fila_impar = (tipo_fila *) malloc (sizeof(tipo_fila));
  fila_par   = (tipo_fila *) malloc (sizeof(tipo_fila));

  inicializar_fila(fila_impar);
  inicializar_fila(fila_par);

  printf("Informe o numero: (Tendo em mente que 0 finalisa)\n");
  scanf("%d",&num);
  while (num != 0)
  {
    if (num % 2 == 0) enqueue(num, fila_par);
    else enqueue(num, fila_impar);

    scanf("%d", &num);
  }

  printf("\nImpar\n");
  imprimir_fila(fila_impar);

  printf("\nPar\n");
  imprimir_fila(fila_par);

  printf("\n");

  while ((fila_par -> inicio != NULL) || (fila_impar -> inicio != NULL))
  {
     if (!fila_vazia(fila_impar))
     {
        num = dequeue(fila_impar);
        printf("Retirando %d da impar\n", num);
     }

     if (!fila_vazia(fila_par))
     {
        num = dequeue(fila_par);
        printf("Retirando %d da par\n", num);
     }
  }

  printf ("\n Todos os numeros foram retirados com exito\n");
  getch();
}
