#include <windows.h>
main(){
    int frequencia=1000;
    while (1){
    Beep(frequencia*=10,10000);
    }
}
