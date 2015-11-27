#include<stdio.h>
#include<conio.h>

 void func (int *id, char *mod[20])
{

  if (*id < 5){
    *mod[20] = 'Fora de Intervalo';
   } else {
       if (*id < 8){
           *mod[20] = 'Infantil A';
       } else {
           if (*id < 11){
               *mod[20] = 'Infantil B';
           } else {
              if (*id < 14){
                    *mod[20] = 'Juvenil A';
                 } else {
                     if (*id < 18){
                         *mod[20] = "Juvenil B";
                      } else {
                          *mod[20] = 'Adulto';
                      }
}

main()
{
  printf ("Informe a idade do nadador\n");
  int id=0;
  char mod[20];
  scanf ("%d",&id);
  func (&id,&mod);

  printf ("%s",mod[20]);
  getch();
}
