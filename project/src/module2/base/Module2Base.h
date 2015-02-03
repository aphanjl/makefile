#ifndef CXX_MODULE2BASE_H
#define CXX_MODULE2BASE_H

class Module2Base
{
public:
    Module2Base() {}
    virtual ~Module2Base() {}
    virtual void start() = 0;
    virtual void stop() = 0;
};

#endif
