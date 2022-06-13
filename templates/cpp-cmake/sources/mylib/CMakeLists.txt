set(target mylib)

add_library(${target} src/example.cpp)

target_include_directories(${target} PUBLIC include)
target_compile_features (${target} PUBLIC cxx_std_20)
