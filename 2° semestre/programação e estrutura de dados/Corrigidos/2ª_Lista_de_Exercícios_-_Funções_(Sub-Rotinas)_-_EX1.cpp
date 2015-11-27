#include <conio.h>
#include <stdio.h>

// -----------------------------------------------
// Funcao que Retorna a Soma por Parâmetro (void)
// -----------------------------------------------

void adicionar(float p_num1, float p_num2, float *p_soma)
{
     *p_soma = p_num1 + p_num2;
}     

// -----------------------------------------------------
// Funcao que Retorna a Soma no nome da função (return)
// -----------------------------------------------------

float somar(float p_num1, float p_num2)
{
     float soma;
     soma = p_num1 + p_num2;
     return(soma);
}     

main()
{
      float num1, num2, soma;
      printf("Entre com dois numeros reais\n");
      scanf("%f%f", &num1, &num2);
      adicionar(num1, num2, &soma);
      printf("\nSoma de %.2f e %.2f -> %.2f (Soma Retornada Via Parametro por Referencia)\n\n", num1, num2, soma);
      getch();
      
      soma = somar(num1, num2);
      printf("Soma de %.2f e %.2f -> %.2f (Soma Retornada no Nome da Funcao)", num1, num2, soma);
      getch();
}
