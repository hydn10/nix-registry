#include <mylib/example.hpp>

#include <greeter.hpp>

#include <iostream>


int
main()
{
  myapp::greet("World");

  int a = 2, b = 3;
  mylib::example ex;

  std::cout << "I can add 2 numbers: " << a << " + " << b << " = " << ex.add(a, b) << std::endl;
}
