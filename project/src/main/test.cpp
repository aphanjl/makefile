
#include<iostream>
#include "test.h"

using namespace std;

test::test()
{
    cout << "test construct" << endl;
}

test::~test()
{
    cout << "test destruct" << endl;
}

