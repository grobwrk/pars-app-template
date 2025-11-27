vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO grobx/pars-cxx
    REF "v${VERSION}"
    SHA512 7f7d4987456d70fcb55ae2b70c34b6df37ce246c27bc1ce8818b45f48d36745b8c88b56b14d982e499800e89c3c54e48fff6c74d10e0c2342d64102a7e01aaa1
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
