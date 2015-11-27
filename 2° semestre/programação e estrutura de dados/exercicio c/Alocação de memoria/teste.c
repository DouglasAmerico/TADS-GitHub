#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

void alocdim2()
{
    int *a;
    int n,i;
    puts ("Informe o numero de elementose a serem lidos: ");
    scanf ("%d",&n);
    a =(int *)malloc(n * sizeof(int));
    if (a == NULL)
    {
        puts ("Erro de alocamento de memoria.\n");
        system ("PAUSE");
        exit (0);
    }
    for (i=0;i<n;i++){
     scanf ("%d",a+i);
    }
    printf ("--------------\n");
    for (i=0;i<n;i++)
    {
        printf ("%d",a[i]);
    }
    getch();
}
main()
{
    alocdim2();
}
