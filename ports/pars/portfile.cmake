vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO grobwrk/pars
    REF "v${VERSION}"
    SHA512 e848cea6051e95556f095c956378c7739e7737beba3be59f428511e72d7e6f8e0a971e1fd83c736e50372fb068d56816673d26f85be727223a2e2f18621b6240
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
