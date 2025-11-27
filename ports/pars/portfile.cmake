vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO grobx/pars-cxx
    REF "v${VERSION}"
    SHA512 c05eac6d707f57d6bbdb6bfccf55b267a24d628c608976f073e6f325fadb910d5a7879fb99a8f491e938edc9421d6dc3de0eef2b6d4d7aeb508ce9dfd55fc863
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/pars)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/lib"
    "${CURRENT_PACKAGES_DIR}/debug"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
