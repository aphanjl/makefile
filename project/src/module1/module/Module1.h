#ifndef CXX_MODULE1_H
#define CXX_MODULE1_H

#include "Module1Base.h"

class Module1: public Module1Base
{
public:
    Module1();
    virtual ~Module1();
    virtual void start();
    virtual void stop();
};

#endif
