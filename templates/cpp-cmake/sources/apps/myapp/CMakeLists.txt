set(target myapp)

add_executable(${target}
  src/main.cpp
  src/greeter.cpp)

target_include_directories(${target} PRIVATE include)
target_compile_features(${target} PRIVATE cxx_std_20)

target_link_libraries(${target} PRIVATE mylib)

install(TARGETS ${target})
