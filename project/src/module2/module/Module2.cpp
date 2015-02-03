#include<iostream>

#ifndef CXX_MODULE2_H
#include "Module2.h"
#endif 

Module2::Module2()
: Module2Base()
{
    std::cout<<"Module2 construct!"<<std::endl;
}

Module2::~Module2()
{
    std::cout<<"Module2 destruct!"<<std::endl;
}

void Module2::start() 
{
    std::cout<<"Module2 start!"<<std::endl;
}

void Module2::stop()
{
    std::cout<<"Module2 stop!"<<std::endl;
}
