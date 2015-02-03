
#include<iostream>
using namespace std;
#include "test.h"
#include "Module1.h"
#include "Module2.h"

int main()
{
    cout<< "This is my first makefile project"<<endl;

    test t1;

    Module1 cModule1;
    cModule1.start();
    cModule1.stop();

    Module2 cModule2;
    cModule2.start();
    cModule2.stop();

    return 0;
}
