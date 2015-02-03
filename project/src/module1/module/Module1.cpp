#include<iostream>

#ifndef CXX_MODULE1_H
#include "Module1.h"
#endif 

Module1::Module1()
: Module1Base()
{
    std::cout<<"Module1 construct!"<<std::endl;
}

Module1::~Module1()
{
    std::cout<<"Module1 destruct!"<<std::endl;
}

void Module1::start() 
{
    std::cout<<"Module1 start!"<<std::endl;
}

void Module1::stop()
{
    std::cout<<"Module1 stop!"<<std::endl;
}
