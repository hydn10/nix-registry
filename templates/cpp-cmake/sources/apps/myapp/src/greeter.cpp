#include <greeter.hpp>

#include <iostream>


namespace myapp
{

void
greet(std::string_view name)
{
  std::cout << "Hello, " << name << "!\n";
}

} // namespace myapp
