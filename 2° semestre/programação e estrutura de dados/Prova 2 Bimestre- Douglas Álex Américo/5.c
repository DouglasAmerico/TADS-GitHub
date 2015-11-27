#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

main()
{
    int *pont1, *pont2,num;
    num = 15;
    pont1 = (int *) malloc (sizeof(int));
    pont2 = pont1;
    *pont1 = 25;
    free(pont1);
    pont1= &num;
    *pont1= 90;
    printf ("%d",num);
    getch ();
}
