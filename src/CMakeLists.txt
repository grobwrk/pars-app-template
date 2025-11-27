find_package (pars CONFIG REQUIRED)
add_executable (
    pars_cxx_template
    "client.cpp"
    "common.h"
    "event.h"
)
target_link_libraries (pars_cxx_template PUBLIC pars::pars)
target_include_directories (pars_cxx_template PUBLIC pars::pars)
