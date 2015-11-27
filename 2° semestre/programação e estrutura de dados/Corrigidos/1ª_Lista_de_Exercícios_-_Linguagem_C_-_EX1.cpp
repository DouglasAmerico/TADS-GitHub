#include<stdlib.h>
#include<stdio.h> 
#include<conio.h>

main()
{
    system("cls");

    float qtde_ch_seg, qtde_ch_ter, qtde_ch_qua, 
          qtde_ch_qui, qtde_ch_sex, qtde_ch_mm;
           
    printf("Entre com a quantidade de chuva (em polegadas) da segunda-feira\n");
    scanf("%f", &qtde_ch_seg); 
    printf("Entre com a quantidade de chuva (em polegadas) da terça-feira\n");
    scanf("%f", &qtde_ch_ter); 
    printf("Entre com a quantidade de chuva (em polegadas) da quarta-feira\n");
    scanf("%f", &qtde_ch_qua); 
    printf("Entre com a quantidade de chuva (em polegadas) da quinta-feira\n");
    scanf("%f", &qtde_ch_qui); 
    printf("Entre com a quantidade de chuva (em polegadas) da sexta-feira\n");
    scanf("%f", &qtde_ch_sex); 
    
    float qtde_ch = qtde_ch_seg + qtde_ch_ter + qtde_ch_qua + qtde_ch_qui + qtde_ch_sex; 
    
    qtde_ch_mm = qtde_ch * 25.4;
    
    printf("A quantidade de chuva convertida em mm é %.2f", qtde_ch_mm);
    
    getch();
}    
