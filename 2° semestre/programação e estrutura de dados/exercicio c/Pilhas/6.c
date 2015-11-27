#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
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
//------------------------------
// criar
tipo_pilha *criar()
{
  tipo_pilha *p;
  p = (tipo_pilha *) malloc(sizeof(tipo_pilha));
  p -> topo = NULL;
  return p;
}
//------------------------------
// adicionando
void push(tipo_pilha *p,char x)
{
  tipo_no *aux;
  aux = (tipo_no *) malloc(sizeof(tipo_no));
  aux -> info = x;
  aux -> prox = p -> topo;
  p   -> topo = aux;
}
//------------------------------

int verificacao(tipo_pilha *p)
{
   int cont=0;
  tipo_no *aux = p -> topo;
  while (aux != NULL)
  {
    if (toupper(aux -> info) == 'A')
    {
        ++cont;
    }
   aux= aux -> prox;
  }
  return cont;
}

//------------------------------
main()
{
  char letra;
  int numero_de_vezes=0;
  tipo_pilha *pilha;
  pilha = criar();

  printf ("Informe a letra: ");
  scanf  ("%c",&letra);
  while (toupper(letra) != 'X')
  {
      push(pilha,letra);
      fflush (stdin);
      printf ("Informe a letra: ");
      scanf  ("%c",&letra);
  }

  verificacao(pilha);
  printf ("O numero de vezes que aparece a letra A é %d",verificacao(pilha));
  getch  ();

}
