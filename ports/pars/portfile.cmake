vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO grobwrk/pars
    REF "v${VERSION}"
    SHA512 b126fccb4be1d901dc24e6ac433a8f91e742dad43540d4292ddf0fddba16fa61bbdf6095e4d35da12ab2c3206f9a8cedf72739e6e0b9c3e83287ac1785444649
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
