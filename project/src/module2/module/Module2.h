#ifndef CXX_MODULE2_H
#define CXX_MODULE2_H

#include "Module2Base.h"

class Module2: public Module2Base
{
public:
    Module2();
    virtual ~Module2();
    virtual void start();
    virtual void stop();
};

#endif
