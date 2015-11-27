#include <conio.h>
#include <stdio.h>

float volume_esfera(float p_raio)
{
     float volume;
     volume = ((float)4/3) * (p_raio * p_raio * p_raio);
     return(volume);
}     

main()
{
      float raio, v;
      printf("Entre com o raio da esfera\n");
      scanf("%f", &raio);
      v = volume_esfera(raio);
      printf("\nVolume da Esfera -> %.2f\n", v);
      getch();
}
