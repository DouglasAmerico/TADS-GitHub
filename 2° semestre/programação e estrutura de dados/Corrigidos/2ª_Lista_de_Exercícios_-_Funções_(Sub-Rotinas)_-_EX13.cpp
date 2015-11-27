#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

int soma_l5_c3(int p_mat[][6])
{
      int linha, coluna, soma;
      soma = 0;
      for (linha = 0; linha <= 6; ++linha)
        for (coluna = 0; coluna <= 5; ++coluna)
           if ((linha == 4) || (coluna == 2)) soma += p_mat[linha][coluna];
    
      return(soma);
}     

main()
{
      int linha, coluna, mat[7][6], s;
      printf("Entre com os elementos da matriz\n");
      for (linha = 0; linha <= 6; ++linha)
         for (coluna = 0; coluna <= 5; ++ coluna)
            scanf("%d", &mat[linha][coluna]);      
      s = soma_l5_c3(mat);
      printf("\nSoma da linha 5 e coluna 3 -> %d", s);
      getch();
}
