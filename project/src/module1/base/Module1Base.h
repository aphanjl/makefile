#ifndef CXX_MODULE1BASE_H
#define CXX_MODULE1BASE_H

class Module1Base
{
public:
    Module1Base() {}
    virtual ~Module1Base() {}
    virtual void start() = 0;
    virtual void stop() = 0;
};

#endif
