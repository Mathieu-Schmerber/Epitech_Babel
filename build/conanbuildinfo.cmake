include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  QT
#################
set(CONAN_QT_ROOT "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5")
set(CONAN_INCLUDE_DIRS_QT "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/include")
set(CONAN_LIB_DIRS_QT "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/lib")
set(CONAN_BIN_DIRS_QT "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/bin")
set(CONAN_RES_DIRS_QT )
set(CONAN_SRC_DIRS_QT )
set(CONAN_BUILD_DIRS_QT "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/")
set(CONAN_FRAMEWORK_DIRS_QT )
set(CONAN_LIBS_QT )
set(CONAN_PKG_LIBS_QT )
set(CONAN_SYSTEM_LIBS_QT )
set(CONAN_FRAMEWORKS_QT )
set(CONAN_FRAMEWORKS_FOUND_QT "")  # Will be filled later
set(CONAN_DEFINES_QT )
set(CONAN_BUILD_MODULES_PATHS_QT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_QT )

set(CONAN_C_FLAGS_QT "")
set(CONAN_CXX_FLAGS_QT "")
set(CONAN_SHARED_LINKER_FLAGS_QT "")
set(CONAN_EXE_LINKER_FLAGS_QT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_QT_LIST "")
set(CONAN_CXX_FLAGS_QT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_QT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_QT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_QT "${CONAN_FRAMEWORKS_QT}" "_QT" "")
# Append to aggregated values variable
set(CONAN_LIBS_QT ${CONAN_PKG_LIBS_QT} ${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT})


#################
###  PORTAUDIO
#################
set(CONAN_PORTAUDIO_ROOT "/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967")
set(CONAN_INCLUDE_DIRS_PORTAUDIO "/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/include")
set(CONAN_LIB_DIRS_PORTAUDIO "/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/lib")
set(CONAN_BIN_DIRS_PORTAUDIO )
set(CONAN_RES_DIRS_PORTAUDIO )
set(CONAN_SRC_DIRS_PORTAUDIO )
set(CONAN_BUILD_DIRS_PORTAUDIO "/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/")
set(CONAN_FRAMEWORK_DIRS_PORTAUDIO )
set(CONAN_LIBS_PORTAUDIO portaudio)
set(CONAN_PKG_LIBS_PORTAUDIO portaudio)
set(CONAN_SYSTEM_LIBS_PORTAUDIO m pthread jack)
set(CONAN_FRAMEWORKS_PORTAUDIO )
set(CONAN_FRAMEWORKS_FOUND_PORTAUDIO "")  # Will be filled later
set(CONAN_DEFINES_PORTAUDIO )
set(CONAN_BUILD_MODULES_PATHS_PORTAUDIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PORTAUDIO )

set(CONAN_C_FLAGS_PORTAUDIO "")
set(CONAN_CXX_FLAGS_PORTAUDIO "")
set(CONAN_SHARED_LINKER_FLAGS_PORTAUDIO "")
set(CONAN_EXE_LINKER_FLAGS_PORTAUDIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PORTAUDIO_LIST "")
set(CONAN_CXX_FLAGS_PORTAUDIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PORTAUDIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PORTAUDIO "${CONAN_FRAMEWORKS_PORTAUDIO}" "_PORTAUDIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_PORTAUDIO ${CONAN_PKG_LIBS_PORTAUDIO} ${CONAN_SYSTEM_LIBS_PORTAUDIO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO})


#################
###  OPUS
#################
set(CONAN_OPUS_ROOT "/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_OPUS "/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/opus")
set(CONAN_LIB_DIRS_OPUS "/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_OPUS )
set(CONAN_RES_DIRS_OPUS )
set(CONAN_SRC_DIRS_OPUS )
set(CONAN_BUILD_DIRS_OPUS "/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_OPUS )
set(CONAN_LIBS_OPUS opus m)
set(CONAN_PKG_LIBS_OPUS opus m)
set(CONAN_SYSTEM_LIBS_OPUS )
set(CONAN_FRAMEWORKS_OPUS )
set(CONAN_FRAMEWORKS_FOUND_OPUS "")  # Will be filled later
set(CONAN_DEFINES_OPUS )
set(CONAN_BUILD_MODULES_PATHS_OPUS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPUS )

set(CONAN_C_FLAGS_OPUS "")
set(CONAN_CXX_FLAGS_OPUS "")
set(CONAN_SHARED_LINKER_FLAGS_OPUS "")
set(CONAN_EXE_LINKER_FLAGS_OPUS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPUS_LIST "")
set(CONAN_CXX_FLAGS_OPUS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPUS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPUS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPUS "${CONAN_FRAMEWORKS_OPUS}" "_OPUS" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPUS ${CONAN_PKG_LIBS_OPUS} ${CONAN_SYSTEM_LIBS_OPUS} ${CONAN_FRAMEWORKS_FOUND_OPUS})


#################
###  DOUBLE-CONVERSION
#################
set(CONAN_DOUBLE-CONVERSION_ROOT "/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8")
set(CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION "/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/include")
set(CONAN_LIB_DIRS_DOUBLE-CONVERSION "/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/lib")
set(CONAN_BIN_DIRS_DOUBLE-CONVERSION )
set(CONAN_RES_DIRS_DOUBLE-CONVERSION )
set(CONAN_SRC_DIRS_DOUBLE-CONVERSION )
set(CONAN_BUILD_DIRS_DOUBLE-CONVERSION "/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/")
set(CONAN_FRAMEWORK_DIRS_DOUBLE-CONVERSION )
set(CONAN_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_PKG_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "")  # Will be filled later
set(CONAN_DEFINES_DOUBLE-CONVERSION )
set(CONAN_BUILD_MODULES_PATHS_DOUBLE-CONVERSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION )

set(CONAN_C_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "${CONAN_FRAMEWORKS_DOUBLE-CONVERSION}" "_DOUBLE-CONVERSION" "")
# Append to aggregated values variable
set(CONAN_LIBS_DOUBLE-CONVERSION ${CONAN_PKG_LIBS_DOUBLE-CONVERSION} ${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION})


#################
###  FONTCONFIG
#################
set(CONAN_FONTCONFIG_ROOT "/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179")
set(CONAN_INCLUDE_DIRS_FONTCONFIG "/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/include")
set(CONAN_LIB_DIRS_FONTCONFIG "/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/lib")
set(CONAN_BIN_DIRS_FONTCONFIG "/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/bin")
set(CONAN_RES_DIRS_FONTCONFIG )
set(CONAN_SRC_DIRS_FONTCONFIG )
set(CONAN_BUILD_DIRS_FONTCONFIG "/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/")
set(CONAN_FRAMEWORK_DIRS_FONTCONFIG )
set(CONAN_LIBS_FONTCONFIG fontconfig m pthread)
set(CONAN_PKG_LIBS_FONTCONFIG fontconfig m pthread)
set(CONAN_SYSTEM_LIBS_FONTCONFIG )
set(CONAN_FRAMEWORKS_FONTCONFIG )
set(CONAN_FRAMEWORKS_FOUND_FONTCONFIG "")  # Will be filled later
set(CONAN_DEFINES_FONTCONFIG )
set(CONAN_BUILD_MODULES_PATHS_FONTCONFIG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FONTCONFIG )

set(CONAN_C_FLAGS_FONTCONFIG "")
set(CONAN_CXX_FLAGS_FONTCONFIG "")
set(CONAN_SHARED_LINKER_FLAGS_FONTCONFIG "")
set(CONAN_EXE_LINKER_FLAGS_FONTCONFIG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FONTCONFIG_LIST "")
set(CONAN_CXX_FLAGS_FONTCONFIG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FONTCONFIG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FONTCONFIG "${CONAN_FRAMEWORKS_FONTCONFIG}" "_FONTCONFIG" "")
# Append to aggregated values variable
set(CONAN_LIBS_FONTCONFIG ${CONAN_PKG_LIBS_FONTCONFIG} ${CONAN_SYSTEM_LIBS_FONTCONFIG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG})


#################
###  ICU
#################
set(CONAN_ICU_ROOT "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d")
set(CONAN_INCLUDE_DIRS_ICU "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/include")
set(CONAN_LIB_DIRS_ICU "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/lib")
set(CONAN_BIN_DIRS_ICU "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/bin")
set(CONAN_RES_DIRS_ICU "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/res")
set(CONAN_SRC_DIRS_ICU )
set(CONAN_BUILD_DIRS_ICU "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/")
set(CONAN_FRAMEWORK_DIRS_ICU )
set(CONAN_LIBS_ICU icuio icutest icutu icui18n icuuc icudata)
set(CONAN_PKG_LIBS_ICU icuio icutest icutu icui18n icuuc icudata)
set(CONAN_SYSTEM_LIBS_ICU pthread m dl)
set(CONAN_FRAMEWORKS_ICU )
set(CONAN_FRAMEWORKS_FOUND_ICU "")  # Will be filled later
set(CONAN_DEFINES_ICU "-DU_STATIC_IMPLEMENTATION")
set(CONAN_BUILD_MODULES_PATHS_ICU )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ICU "U_STATIC_IMPLEMENTATION")

set(CONAN_C_FLAGS_ICU "")
set(CONAN_CXX_FLAGS_ICU "")
set(CONAN_SHARED_LINKER_FLAGS_ICU "")
set(CONAN_EXE_LINKER_FLAGS_ICU "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ICU_LIST "")
set(CONAN_CXX_FLAGS_ICU_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ICU_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ICU_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ICU "${CONAN_FRAMEWORKS_ICU}" "_ICU" "")
# Append to aggregated values variable
set(CONAN_LIBS_ICU ${CONAN_PKG_LIBS_ICU} ${CONAN_SYSTEM_LIBS_ICU} ${CONAN_FRAMEWORKS_FOUND_ICU})


#################
###  HARFBUZZ
#################
set(CONAN_HARFBUZZ_ROOT "/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204")
set(CONAN_INCLUDE_DIRS_HARFBUZZ "/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/include"
			"/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/include/harfbuzz")
set(CONAN_LIB_DIRS_HARFBUZZ "/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/lib")
set(CONAN_BIN_DIRS_HARFBUZZ )
set(CONAN_RES_DIRS_HARFBUZZ )
set(CONAN_SRC_DIRS_HARFBUZZ )
set(CONAN_BUILD_DIRS_HARFBUZZ "/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/")
set(CONAN_FRAMEWORK_DIRS_HARFBUZZ )
set(CONAN_LIBS_HARFBUZZ harfbuzz)
set(CONAN_PKG_LIBS_HARFBUZZ harfbuzz)
set(CONAN_SYSTEM_LIBS_HARFBUZZ m)
set(CONAN_FRAMEWORKS_HARFBUZZ )
set(CONAN_FRAMEWORKS_FOUND_HARFBUZZ "")  # Will be filled later
set(CONAN_DEFINES_HARFBUZZ )
set(CONAN_BUILD_MODULES_PATHS_HARFBUZZ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_HARFBUZZ )

set(CONAN_C_FLAGS_HARFBUZZ "")
set(CONAN_CXX_FLAGS_HARFBUZZ "")
set(CONAN_SHARED_LINKER_FLAGS_HARFBUZZ "")
set(CONAN_EXE_LINKER_FLAGS_HARFBUZZ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_HARFBUZZ_LIST "")
set(CONAN_CXX_FLAGS_HARFBUZZ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_HARFBUZZ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_HARFBUZZ "${CONAN_FRAMEWORKS_HARFBUZZ}" "_HARFBUZZ" "")
# Append to aggregated values variable
set(CONAN_LIBS_HARFBUZZ ${CONAN_PKG_LIBS_HARFBUZZ} ${CONAN_SYSTEM_LIBS_HARFBUZZ} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ})


#################
###  LIBJPEG
#################
set(CONAN_LIBJPEG_ROOT "/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBJPEG "/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_LIBJPEG "/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBJPEG "/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin")
set(CONAN_RES_DIRS_LIBJPEG )
set(CONAN_SRC_DIRS_LIBJPEG )
set(CONAN_BUILD_DIRS_LIBJPEG "/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBJPEG )
set(CONAN_LIBS_LIBJPEG jpeg)
set(CONAN_PKG_LIBS_LIBJPEG jpeg)
set(CONAN_SYSTEM_LIBS_LIBJPEG )
set(CONAN_FRAMEWORKS_LIBJPEG )
set(CONAN_FRAMEWORKS_FOUND_LIBJPEG "")  # Will be filled later
set(CONAN_DEFINES_LIBJPEG "-DLIBJPEG_STATIC")
set(CONAN_BUILD_MODULES_PATHS_LIBJPEG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBJPEG "LIBJPEG_STATIC")

set(CONAN_C_FLAGS_LIBJPEG "")
set(CONAN_CXX_FLAGS_LIBJPEG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBJPEG_LIST "")
set(CONAN_CXX_FLAGS_LIBJPEG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBJPEG "${CONAN_FRAMEWORKS_LIBJPEG}" "_LIBJPEG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBJPEG ${CONAN_PKG_LIBS_LIBJPEG} ${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG})


#################
###  SQLITE3
#################
set(CONAN_SQLITE3_ROOT "/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94")
set(CONAN_INCLUDE_DIRS_SQLITE3 "/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/include")
set(CONAN_LIB_DIRS_SQLITE3 "/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/lib")
set(CONAN_BIN_DIRS_SQLITE3 "/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/bin")
set(CONAN_RES_DIRS_SQLITE3 )
set(CONAN_SRC_DIRS_SQLITE3 )
set(CONAN_BUILD_DIRS_SQLITE3 "/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/")
set(CONAN_FRAMEWORK_DIRS_SQLITE3 )
set(CONAN_LIBS_SQLITE3 sqlite3)
set(CONAN_PKG_LIBS_SQLITE3 sqlite3)
set(CONAN_SYSTEM_LIBS_SQLITE3 pthread dl)
set(CONAN_FRAMEWORKS_SQLITE3 )
set(CONAN_FRAMEWORKS_FOUND_SQLITE3 "")  # Will be filled later
set(CONAN_DEFINES_SQLITE3 )
set(CONAN_BUILD_MODULES_PATHS_SQLITE3 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE3 )

set(CONAN_C_FLAGS_SQLITE3 "")
set(CONAN_CXX_FLAGS_SQLITE3 "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3 "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE3_LIST "")
set(CONAN_CXX_FLAGS_SQLITE3_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE3 "${CONAN_FRAMEWORKS_SQLITE3}" "_SQLITE3" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE3 ${CONAN_PKG_LIBS_SQLITE3} ${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3})


#################
###  LIBMYSQLCLIENT
#################
set(CONAN_LIBMYSQLCLIENT_ROOT "/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f")
set(CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT "/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/include")
set(CONAN_LIB_DIRS_LIBMYSQLCLIENT "/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/lib")
set(CONAN_BIN_DIRS_LIBMYSQLCLIENT "/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/bin")
set(CONAN_RES_DIRS_LIBMYSQLCLIENT )
set(CONAN_SRC_DIRS_LIBMYSQLCLIENT )
set(CONAN_BUILD_DIRS_LIBMYSQLCLIENT "/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/")
set(CONAN_FRAMEWORK_DIRS_LIBMYSQLCLIENT )
set(CONAN_LIBS_LIBMYSQLCLIENT mysqlclient)
set(CONAN_PKG_LIBS_LIBMYSQLCLIENT mysqlclient)
set(CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT stdc++ m)
set(CONAN_FRAMEWORKS_LIBMYSQLCLIENT )
set(CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT "")  # Will be filled later
set(CONAN_DEFINES_LIBMYSQLCLIENT )
set(CONAN_BUILD_MODULES_PATHS_LIBMYSQLCLIENT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT )

set(CONAN_C_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_CXX_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_CXX_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT "${CONAN_FRAMEWORKS_LIBMYSQLCLIENT}" "_LIBMYSQLCLIENT" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBMYSQLCLIENT ${CONAN_PKG_LIBS_LIBMYSQLCLIENT} ${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT})


#################
###  LIBPQ
#################
set(CONAN_LIBPQ_ROOT "/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d")
set(CONAN_INCLUDE_DIRS_LIBPQ "/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/include")
set(CONAN_LIB_DIRS_LIBPQ "/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/lib")
set(CONAN_BIN_DIRS_LIBPQ "/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/bin")
set(CONAN_RES_DIRS_LIBPQ )
set(CONAN_SRC_DIRS_LIBPQ )
set(CONAN_BUILD_DIRS_LIBPQ "/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/")
set(CONAN_FRAMEWORK_DIRS_LIBPQ )
set(CONAN_LIBS_LIBPQ pq pgcommon)
set(CONAN_PKG_LIBS_LIBPQ pq pgcommon)
set(CONAN_SYSTEM_LIBS_LIBPQ pthread)
set(CONAN_FRAMEWORKS_LIBPQ )
set(CONAN_FRAMEWORKS_FOUND_LIBPQ "")  # Will be filled later
set(CONAN_DEFINES_LIBPQ )
set(CONAN_BUILD_MODULES_PATHS_LIBPQ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPQ )

set(CONAN_C_FLAGS_LIBPQ "")
set(CONAN_CXX_FLAGS_LIBPQ "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPQ_LIST "")
set(CONAN_CXX_FLAGS_LIBPQ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPQ "${CONAN_FRAMEWORKS_LIBPQ}" "_LIBPQ" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPQ ${CONAN_PKG_LIBS_LIBPQ} ${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ})


#################
###  ODBC
#################
set(CONAN_ODBC_ROOT "/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522")
set(CONAN_INCLUDE_DIRS_ODBC "/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/include")
set(CONAN_LIB_DIRS_ODBC "/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/lib")
set(CONAN_BIN_DIRS_ODBC "/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/bin")
set(CONAN_RES_DIRS_ODBC )
set(CONAN_SRC_DIRS_ODBC )
set(CONAN_BUILD_DIRS_ODBC "/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/")
set(CONAN_FRAMEWORK_DIRS_ODBC )
set(CONAN_LIBS_ODBC odbc odbccr odbcinst ltdl dl)
set(CONAN_PKG_LIBS_ODBC odbc odbccr odbcinst ltdl dl)
set(CONAN_SYSTEM_LIBS_ODBC )
set(CONAN_FRAMEWORKS_ODBC )
set(CONAN_FRAMEWORKS_FOUND_ODBC "")  # Will be filled later
set(CONAN_DEFINES_ODBC )
set(CONAN_BUILD_MODULES_PATHS_ODBC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ODBC )

set(CONAN_C_FLAGS_ODBC "")
set(CONAN_CXX_FLAGS_ODBC "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC "")
set(CONAN_EXE_LINKER_FLAGS_ODBC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ODBC_LIST "")
set(CONAN_CXX_FLAGS_ODBC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ODBC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ODBC "${CONAN_FRAMEWORKS_ODBC}" "_ODBC" "")
# Append to aggregated values variable
set(CONAN_LIBS_ODBC ${CONAN_PKG_LIBS_ODBC} ${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC})


#################
###  XCB-UTIL-KEYSYMS
#################
set(CONAN_XCB-UTIL-KEYSYMS_ROOT "/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9")
set(CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS "/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include")
set(CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS "/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib")
set(CONAN_BIN_DIRS_XCB-UTIL-KEYSYMS )
set(CONAN_RES_DIRS_XCB-UTIL-KEYSYMS )
set(CONAN_SRC_DIRS_XCB-UTIL-KEYSYMS )
set(CONAN_BUILD_DIRS_XCB-UTIL-KEYSYMS "/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-UTIL-KEYSYMS )
set(CONAN_LIBS_XCB-UTIL-KEYSYMS xcb-keysyms)
set(CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS xcb-keysyms)
set(CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS )
set(CONAN_FRAMEWORKS_XCB-UTIL-KEYSYMS )
set(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS "")  # Will be filled later
set(CONAN_DEFINES_XCB-UTIL-KEYSYMS )
set(CONAN_BUILD_MODULES_PATHS_XCB-UTIL-KEYSYMS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS )

set(CONAN_C_FLAGS_XCB-UTIL-KEYSYMS "")
set(CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_LIST "")
set(CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS "${CONAN_FRAMEWORKS_XCB-UTIL-KEYSYMS}" "_XCB-UTIL-KEYSYMS" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-UTIL-KEYSYMS ${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS} ${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS})


#################
###  XCB-UTIL-RENDERUTIL
#################
set(CONAN_XCB-UTIL-RENDERUTIL_ROOT "/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9")
set(CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL "/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include")
set(CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL "/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib")
set(CONAN_BIN_DIRS_XCB-UTIL-RENDERUTIL )
set(CONAN_RES_DIRS_XCB-UTIL-RENDERUTIL )
set(CONAN_SRC_DIRS_XCB-UTIL-RENDERUTIL )
set(CONAN_BUILD_DIRS_XCB-UTIL-RENDERUTIL "/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-UTIL-RENDERUTIL )
set(CONAN_LIBS_XCB-UTIL-RENDERUTIL xcb-render-util)
set(CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL xcb-render-util)
set(CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL )
set(CONAN_FRAMEWORKS_XCB-UTIL-RENDERUTIL )
set(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL "")  # Will be filled later
set(CONAN_DEFINES_XCB-UTIL-RENDERUTIL )
set(CONAN_BUILD_MODULES_PATHS_XCB-UTIL-RENDERUTIL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL )

set(CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL "")
set(CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_LIST "")
set(CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL "${CONAN_FRAMEWORKS_XCB-UTIL-RENDERUTIL}" "_XCB-UTIL-RENDERUTIL" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-UTIL-RENDERUTIL ${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL} ${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL})


#################
###  XCB-UTIL-WM
#################
set(CONAN_XCB-UTIL-WM_ROOT "/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9")
set(CONAN_INCLUDE_DIRS_XCB-UTIL-WM "/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include")
set(CONAN_LIB_DIRS_XCB-UTIL-WM "/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib")
set(CONAN_BIN_DIRS_XCB-UTIL-WM )
set(CONAN_RES_DIRS_XCB-UTIL-WM )
set(CONAN_SRC_DIRS_XCB-UTIL-WM )
set(CONAN_BUILD_DIRS_XCB-UTIL-WM "/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-UTIL-WM )
set(CONAN_LIBS_XCB-UTIL-WM xcb-ewmh xcb-icccm)
set(CONAN_PKG_LIBS_XCB-UTIL-WM xcb-ewmh xcb-icccm)
set(CONAN_SYSTEM_LIBS_XCB-UTIL-WM )
set(CONAN_FRAMEWORKS_XCB-UTIL-WM )
set(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM "")  # Will be filled later
set(CONAN_DEFINES_XCB-UTIL-WM )
set(CONAN_BUILD_MODULES_PATHS_XCB-UTIL-WM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM )

set(CONAN_C_FLAGS_XCB-UTIL-WM "")
set(CONAN_CXX_FLAGS_XCB-UTIL-WM "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-UTIL-WM_LIST "")
set(CONAN_CXX_FLAGS_XCB-UTIL-WM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM "${CONAN_FRAMEWORKS_XCB-UTIL-WM}" "_XCB-UTIL-WM" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-UTIL-WM ${CONAN_PKG_LIBS_XCB-UTIL-WM} ${CONAN_SYSTEM_LIBS_XCB-UTIL-WM} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM})


#################
###  XCB-UTIL-IMAGE
#################
set(CONAN_XCB-UTIL-IMAGE_ROOT "/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448")
set(CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE "/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/include")
set(CONAN_LIB_DIRS_XCB-UTIL-IMAGE "/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/lib")
set(CONAN_BIN_DIRS_XCB-UTIL-IMAGE )
set(CONAN_RES_DIRS_XCB-UTIL-IMAGE )
set(CONAN_SRC_DIRS_XCB-UTIL-IMAGE )
set(CONAN_BUILD_DIRS_XCB-UTIL-IMAGE "/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/"
			"/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-UTIL-IMAGE )
set(CONAN_LIBS_XCB-UTIL-IMAGE xcb-image)
set(CONAN_PKG_LIBS_XCB-UTIL-IMAGE xcb-image)
set(CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE )
set(CONAN_FRAMEWORKS_XCB-UTIL-IMAGE )
set(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE "")  # Will be filled later
set(CONAN_DEFINES_XCB-UTIL-IMAGE )
set(CONAN_BUILD_MODULES_PATHS_XCB-UTIL-IMAGE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE )

set(CONAN_C_FLAGS_XCB-UTIL-IMAGE "")
set(CONAN_CXX_FLAGS_XCB-UTIL-IMAGE "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-UTIL-IMAGE_LIST "")
set(CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE "${CONAN_FRAMEWORKS_XCB-UTIL-IMAGE}" "_XCB-UTIL-IMAGE" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-UTIL-IMAGE ${CONAN_PKG_LIBS_XCB-UTIL-IMAGE} ${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE})


#################
###  LIBXCURSOR
#################
set(CONAN_LIBXCURSOR_ROOT "/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343")
set(CONAN_INCLUDE_DIRS_LIBXCURSOR "/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/include")
set(CONAN_LIB_DIRS_LIBXCURSOR "/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/lib")
set(CONAN_BIN_DIRS_LIBXCURSOR )
set(CONAN_RES_DIRS_LIBXCURSOR )
set(CONAN_SRC_DIRS_LIBXCURSOR )
set(CONAN_BUILD_DIRS_LIBXCURSOR "/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/"
			"/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXCURSOR )
set(CONAN_LIBS_LIBXCURSOR Xcursor)
set(CONAN_PKG_LIBS_LIBXCURSOR Xcursor)
set(CONAN_SYSTEM_LIBS_LIBXCURSOR )
set(CONAN_FRAMEWORKS_LIBXCURSOR )
set(CONAN_FRAMEWORKS_FOUND_LIBXCURSOR "")  # Will be filled later
set(CONAN_DEFINES_LIBXCURSOR )
set(CONAN_BUILD_MODULES_PATHS_LIBXCURSOR )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXCURSOR )

set(CONAN_C_FLAGS_LIBXCURSOR "")
set(CONAN_CXX_FLAGS_LIBXCURSOR "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR "")
set(CONAN_EXE_LINKER_FLAGS_LIBXCURSOR "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXCURSOR_LIST "")
set(CONAN_CXX_FLAGS_LIBXCURSOR_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXCURSOR "${CONAN_FRAMEWORKS_LIBXCURSOR}" "_LIBXCURSOR" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXCURSOR ${CONAN_PKG_LIBS_LIBXCURSOR} ${CONAN_SYSTEM_LIBS_LIBXCURSOR} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR})


#################
###  XKBCOMMON
#################
set(CONAN_XKBCOMMON_ROOT "/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78")
set(CONAN_INCLUDE_DIRS_XKBCOMMON "/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/include")
set(CONAN_LIB_DIRS_XKBCOMMON "/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/lib")
set(CONAN_BIN_DIRS_XKBCOMMON )
set(CONAN_RES_DIRS_XKBCOMMON )
set(CONAN_SRC_DIRS_XKBCOMMON )
set(CONAN_BUILD_DIRS_XKBCOMMON "/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/")
set(CONAN_FRAMEWORK_DIRS_XKBCOMMON )
set(CONAN_LIBS_XKBCOMMON xkbcommon xkbcommon-x11)
set(CONAN_PKG_LIBS_XKBCOMMON xkbcommon xkbcommon-x11)
set(CONAN_SYSTEM_LIBS_XKBCOMMON )
set(CONAN_FRAMEWORKS_XKBCOMMON )
set(CONAN_FRAMEWORKS_FOUND_XKBCOMMON "")  # Will be filled later
set(CONAN_DEFINES_XKBCOMMON )
set(CONAN_BUILD_MODULES_PATHS_XKBCOMMON )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XKBCOMMON )

set(CONAN_C_FLAGS_XKBCOMMON "")
set(CONAN_CXX_FLAGS_XKBCOMMON "")
set(CONAN_SHARED_LINKER_FLAGS_XKBCOMMON "")
set(CONAN_EXE_LINKER_FLAGS_XKBCOMMON "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XKBCOMMON_LIST "")
set(CONAN_CXX_FLAGS_XKBCOMMON_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XKBCOMMON_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XKBCOMMON "${CONAN_FRAMEWORKS_XKBCOMMON}" "_XKBCOMMON" "")
# Append to aggregated values variable
set(CONAN_LIBS_XKBCOMMON ${CONAN_PKG_LIBS_XKBCOMMON} ${CONAN_SYSTEM_LIBS_XKBCOMMON} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON})


#################
###  ZSTD
#################
set(CONAN_ZSTD_ROOT "/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_ZSTD "/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_ZSTD "/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_ZSTD )
set(CONAN_RES_DIRS_ZSTD )
set(CONAN_SRC_DIRS_ZSTD )
set(CONAN_BUILD_DIRS_ZSTD "/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_ZSTD )
set(CONAN_LIBS_ZSTD zstd)
set(CONAN_PKG_LIBS_ZSTD zstd)
set(CONAN_SYSTEM_LIBS_ZSTD pthread)
set(CONAN_FRAMEWORKS_ZSTD )
set(CONAN_FRAMEWORKS_FOUND_ZSTD "")  # Will be filled later
set(CONAN_DEFINES_ZSTD )
set(CONAN_BUILD_MODULES_PATHS_ZSTD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZSTD )

set(CONAN_C_FLAGS_ZSTD "")
set(CONAN_CXX_FLAGS_ZSTD "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZSTD_LIST "")
set(CONAN_CXX_FLAGS_ZSTD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZSTD "${CONAN_FRAMEWORKS_ZSTD}" "_ZSTD" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})


#################
###  OPENGL
#################
set(CONAN_OPENGL_ROOT "/home/mschmerber/.conan/data/opengl/virtual/bincrafters/stable/package/25315d66e1f567146d60eadc7d8fc22e5398fdaf")
set(CONAN_INCLUDE_DIRS_OPENGL )
set(CONAN_LIB_DIRS_OPENGL )
set(CONAN_BIN_DIRS_OPENGL )
set(CONAN_RES_DIRS_OPENGL )
set(CONAN_SRC_DIRS_OPENGL )
set(CONAN_BUILD_DIRS_OPENGL "/home/mschmerber/.conan/data/opengl/virtual/bincrafters/stable/package/25315d66e1f567146d60eadc7d8fc22e5398fdaf/")
set(CONAN_FRAMEWORK_DIRS_OPENGL )
set(CONAN_LIBS_OPENGL )
set(CONAN_PKG_LIBS_OPENGL )
set(CONAN_SYSTEM_LIBS_OPENGL GL)
set(CONAN_FRAMEWORKS_OPENGL )
set(CONAN_FRAMEWORKS_FOUND_OPENGL "")  # Will be filled later
set(CONAN_DEFINES_OPENGL )
set(CONAN_BUILD_MODULES_PATHS_OPENGL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENGL )

set(CONAN_C_FLAGS_OPENGL "")
set(CONAN_CXX_FLAGS_OPENGL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENGL_LIST "")
set(CONAN_CXX_FLAGS_OPENGL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENGL "${CONAN_FRAMEWORKS_OPENGL}" "_OPENGL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENGL ${CONAN_PKG_LIBS_OPENGL} ${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL})


#################
###  LIBALSA
#################
set(CONAN_LIBALSA_ROOT "/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639")
set(CONAN_INCLUDE_DIRS_LIBALSA "/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/include")
set(CONAN_LIB_DIRS_LIBALSA "/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/lib")
set(CONAN_BIN_DIRS_LIBALSA "/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/bin")
set(CONAN_RES_DIRS_LIBALSA )
set(CONAN_SRC_DIRS_LIBALSA )
set(CONAN_BUILD_DIRS_LIBALSA "/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/")
set(CONAN_FRAMEWORK_DIRS_LIBALSA )
set(CONAN_LIBS_LIBALSA asound)
set(CONAN_PKG_LIBS_LIBALSA asound)
set(CONAN_SYSTEM_LIBS_LIBALSA dl m rt pthread)
set(CONAN_FRAMEWORKS_LIBALSA )
set(CONAN_FRAMEWORKS_FOUND_LIBALSA "")  # Will be filled later
set(CONAN_DEFINES_LIBALSA )
set(CONAN_BUILD_MODULES_PATHS_LIBALSA )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBALSA )

set(CONAN_C_FLAGS_LIBALSA "")
set(CONAN_CXX_FLAGS_LIBALSA "")
set(CONAN_SHARED_LINKER_FLAGS_LIBALSA "")
set(CONAN_EXE_LINKER_FLAGS_LIBALSA "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBALSA_LIST "")
set(CONAN_CXX_FLAGS_LIBALSA_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBALSA_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBALSA_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBALSA "${CONAN_FRAMEWORKS_LIBALSA}" "_LIBALSA" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBALSA ${CONAN_PKG_LIBS_LIBALSA} ${CONAN_SYSTEM_LIBS_LIBALSA} ${CONAN_FRAMEWORKS_FOUND_LIBALSA})


#################
###  OPENSSL
#################
set(CONAN_OPENSSL_ROOT "/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_OPENSSL "/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_OPENSSL "/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_OPENSSL "/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin")
set(CONAN_RES_DIRS_OPENSSL )
set(CONAN_SRC_DIRS_OPENSSL )
set(CONAN_BUILD_DIRS_OPENSSL "/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_OPENSSL )
set(CONAN_LIBS_OPENSSL ssl crypto)
set(CONAN_PKG_LIBS_OPENSSL ssl crypto)
set(CONAN_SYSTEM_LIBS_OPENSSL dl pthread)
set(CONAN_FRAMEWORKS_OPENSSL )
set(CONAN_FRAMEWORKS_FOUND_OPENSSL "")  # Will be filled later
set(CONAN_DEFINES_OPENSSL )
set(CONAN_BUILD_MODULES_PATHS_OPENSSL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENSSL )

set(CONAN_C_FLAGS_OPENSSL "")
set(CONAN_CXX_FLAGS_OPENSSL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENSSL_LIST "")
set(CONAN_CXX_FLAGS_OPENSSL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENSSL "${CONAN_FRAMEWORKS_OPENSSL}" "_OPENSSL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENSSL ${CONAN_PKG_LIBS_OPENSSL} ${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL})


#################
###  GLIB
#################
set(CONAN_GLIB_ROOT "/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81")
set(CONAN_INCLUDE_DIRS_GLIB "/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/include"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/include/glib-2.0"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/lib/glib-2.0/include")
set(CONAN_LIB_DIRS_GLIB "/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/lib")
set(CONAN_BIN_DIRS_GLIB "/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/bin")
set(CONAN_RES_DIRS_GLIB )
set(CONAN_SRC_DIRS_GLIB )
set(CONAN_BUILD_DIRS_GLIB "/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/")
set(CONAN_FRAMEWORK_DIRS_GLIB )
set(CONAN_LIBS_GLIB gio-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 glib-2.0)
set(CONAN_PKG_LIBS_GLIB gio-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 glib-2.0)
set(CONAN_SYSTEM_LIBS_GLIB pthread resolv dl)
set(CONAN_FRAMEWORKS_GLIB )
set(CONAN_FRAMEWORKS_FOUND_GLIB "")  # Will be filled later
set(CONAN_DEFINES_GLIB )
set(CONAN_BUILD_MODULES_PATHS_GLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLIB )

set(CONAN_C_FLAGS_GLIB "")
set(CONAN_CXX_FLAGS_GLIB "")
set(CONAN_SHARED_LINKER_FLAGS_GLIB "")
set(CONAN_EXE_LINKER_FLAGS_GLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLIB_LIST "")
set(CONAN_CXX_FLAGS_GLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLIB "${CONAN_FRAMEWORKS_GLIB}" "_GLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLIB ${CONAN_PKG_LIBS_GLIB} ${CONAN_SYSTEM_LIBS_GLIB} ${CONAN_FRAMEWORKS_FOUND_GLIB})


#################
###  FREETYPE
#################
set(CONAN_FREETYPE_ROOT "/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e")
set(CONAN_INCLUDE_DIRS_FREETYPE "/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/include"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/include/freetype2")
set(CONAN_LIB_DIRS_FREETYPE "/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/lib")
set(CONAN_BIN_DIRS_FREETYPE "/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/bin")
set(CONAN_RES_DIRS_FREETYPE )
set(CONAN_SRC_DIRS_FREETYPE )
set(CONAN_BUILD_DIRS_FREETYPE "/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/")
set(CONAN_FRAMEWORK_DIRS_FREETYPE )
set(CONAN_LIBS_FREETYPE freetype)
set(CONAN_PKG_LIBS_FREETYPE freetype)
set(CONAN_SYSTEM_LIBS_FREETYPE m)
set(CONAN_FRAMEWORKS_FREETYPE )
set(CONAN_FRAMEWORKS_FOUND_FREETYPE "")  # Will be filled later
set(CONAN_DEFINES_FREETYPE )
set(CONAN_BUILD_MODULES_PATHS_FREETYPE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FREETYPE )

set(CONAN_C_FLAGS_FREETYPE "")
set(CONAN_CXX_FLAGS_FREETYPE "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FREETYPE_LIST "")
set(CONAN_CXX_FLAGS_FREETYPE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FREETYPE "${CONAN_FRAMEWORKS_FREETYPE}" "_FREETYPE" "")
# Append to aggregated values variable
set(CONAN_LIBS_FREETYPE ${CONAN_PKG_LIBS_FREETYPE} ${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE})


#################
###  EXPAT
#################
set(CONAN_EXPAT_ROOT "/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_EXPAT "/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_EXPAT "/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_EXPAT )
set(CONAN_RES_DIRS_EXPAT )
set(CONAN_SRC_DIRS_EXPAT )
set(CONAN_BUILD_DIRS_EXPAT "/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_EXPAT )
set(CONAN_LIBS_EXPAT expat)
set(CONAN_PKG_LIBS_EXPAT expat)
set(CONAN_SYSTEM_LIBS_EXPAT )
set(CONAN_FRAMEWORKS_EXPAT )
set(CONAN_FRAMEWORKS_FOUND_EXPAT "")  # Will be filled later
set(CONAN_DEFINES_EXPAT "-DXML_STATIC")
set(CONAN_BUILD_MODULES_PATHS_EXPAT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_EXPAT "XML_STATIC")

set(CONAN_C_FLAGS_EXPAT "")
set(CONAN_CXX_FLAGS_EXPAT "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_EXPAT_LIST "")
set(CONAN_CXX_FLAGS_EXPAT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_EXPAT "${CONAN_FRAMEWORKS_EXPAT}" "_EXPAT" "")
# Append to aggregated values variable
set(CONAN_LIBS_EXPAT ${CONAN_PKG_LIBS_EXPAT} ${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT})


#################
###  LIBUUID
#################
set(CONAN_LIBUUID_ROOT "/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBUUID "/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/uuid")
set(CONAN_LIB_DIRS_LIBUUID "/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBUUID )
set(CONAN_RES_DIRS_LIBUUID )
set(CONAN_SRC_DIRS_LIBUUID )
set(CONAN_BUILD_DIRS_LIBUUID "/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBUUID )
set(CONAN_LIBS_LIBUUID uuid)
set(CONAN_PKG_LIBS_LIBUUID uuid)
set(CONAN_SYSTEM_LIBS_LIBUUID )
set(CONAN_FRAMEWORKS_LIBUUID )
set(CONAN_FRAMEWORKS_FOUND_LIBUUID "")  # Will be filled later
set(CONAN_DEFINES_LIBUUID )
set(CONAN_BUILD_MODULES_PATHS_LIBUUID )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBUUID )

set(CONAN_C_FLAGS_LIBUUID "")
set(CONAN_CXX_FLAGS_LIBUUID "")
set(CONAN_SHARED_LINKER_FLAGS_LIBUUID "")
set(CONAN_EXE_LINKER_FLAGS_LIBUUID "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBUUID_LIST "")
set(CONAN_CXX_FLAGS_LIBUUID_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBUUID_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBUUID "${CONAN_FRAMEWORKS_LIBUUID}" "_LIBUUID" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBUUID ${CONAN_PKG_LIBS_LIBUUID} ${CONAN_SYSTEM_LIBS_LIBUUID} ${CONAN_FRAMEWORKS_FOUND_LIBUUID})


#################
###  LIBICONV
#################
set(CONAN_LIBICONV_ROOT "/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBICONV "/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_LIBICONV "/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBICONV "/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin")
set(CONAN_RES_DIRS_LIBICONV )
set(CONAN_SRC_DIRS_LIBICONV )
set(CONAN_BUILD_DIRS_LIBICONV "/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBICONV )
set(CONAN_LIBS_LIBICONV iconv charset)
set(CONAN_PKG_LIBS_LIBICONV iconv charset)
set(CONAN_SYSTEM_LIBS_LIBICONV )
set(CONAN_FRAMEWORKS_LIBICONV )
set(CONAN_FRAMEWORKS_FOUND_LIBICONV "")  # Will be filled later
set(CONAN_DEFINES_LIBICONV )
set(CONAN_BUILD_MODULES_PATHS_LIBICONV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBICONV )

set(CONAN_C_FLAGS_LIBICONV "")
set(CONAN_CXX_FLAGS_LIBICONV "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBICONV_LIST "")
set(CONAN_CXX_FLAGS_LIBICONV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBICONV "${CONAN_FRAMEWORKS_LIBICONV}" "_LIBICONV" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBICONV ${CONAN_PKG_LIBS_LIBICONV} ${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV})


#################
###  XCB-UTIL
#################
set(CONAN_XCB-UTIL_ROOT "/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9")
set(CONAN_INCLUDE_DIRS_XCB-UTIL "/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include")
set(CONAN_LIB_DIRS_XCB-UTIL "/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib")
set(CONAN_BIN_DIRS_XCB-UTIL )
set(CONAN_RES_DIRS_XCB-UTIL )
set(CONAN_SRC_DIRS_XCB-UTIL )
set(CONAN_BUILD_DIRS_XCB-UTIL "/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-UTIL )
set(CONAN_LIBS_XCB-UTIL xcb-util)
set(CONAN_PKG_LIBS_XCB-UTIL xcb-util)
set(CONAN_SYSTEM_LIBS_XCB-UTIL )
set(CONAN_FRAMEWORKS_XCB-UTIL )
set(CONAN_FRAMEWORKS_FOUND_XCB-UTIL "")  # Will be filled later
set(CONAN_DEFINES_XCB-UTIL )
set(CONAN_BUILD_MODULES_PATHS_XCB-UTIL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-UTIL )

set(CONAN_C_FLAGS_XCB-UTIL "")
set(CONAN_CXX_FLAGS_XCB-UTIL "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-UTIL_LIST "")
set(CONAN_CXX_FLAGS_XCB-UTIL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-UTIL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-UTIL "${CONAN_FRAMEWORKS_XCB-UTIL}" "_XCB-UTIL" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-UTIL ${CONAN_PKG_LIBS_XCB-UTIL} ${CONAN_SYSTEM_LIBS_XCB-UTIL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL})


#################
###  LIBXFIXES
#################
set(CONAN_LIBXFIXES_ROOT "/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b")
set(CONAN_INCLUDE_DIRS_LIBXFIXES "/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/include")
set(CONAN_LIB_DIRS_LIBXFIXES "/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib")
set(CONAN_BIN_DIRS_LIBXFIXES )
set(CONAN_RES_DIRS_LIBXFIXES )
set(CONAN_SRC_DIRS_LIBXFIXES )
set(CONAN_BUILD_DIRS_LIBXFIXES "/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/"
			"/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXFIXES )
set(CONAN_LIBS_LIBXFIXES Xfixes)
set(CONAN_PKG_LIBS_LIBXFIXES Xfixes)
set(CONAN_SYSTEM_LIBS_LIBXFIXES )
set(CONAN_FRAMEWORKS_LIBXFIXES )
set(CONAN_FRAMEWORKS_FOUND_LIBXFIXES "")  # Will be filled later
set(CONAN_DEFINES_LIBXFIXES )
set(CONAN_BUILD_MODULES_PATHS_LIBXFIXES )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXFIXES )

set(CONAN_C_FLAGS_LIBXFIXES "")
set(CONAN_CXX_FLAGS_LIBXFIXES "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXFIXES "")
set(CONAN_EXE_LINKER_FLAGS_LIBXFIXES "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXFIXES_LIST "")
set(CONAN_CXX_FLAGS_LIBXFIXES_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXFIXES_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXFIXES "${CONAN_FRAMEWORKS_LIBXFIXES}" "_LIBXFIXES" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXFIXES ${CONAN_PKG_LIBS_LIBXFIXES} ${CONAN_SYSTEM_LIBS_LIBXFIXES} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES})


#################
###  LIBXRENDER
#################
set(CONAN_LIBXRENDER_ROOT "/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b")
set(CONAN_INCLUDE_DIRS_LIBXRENDER "/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/include")
set(CONAN_LIB_DIRS_LIBXRENDER "/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib")
set(CONAN_BIN_DIRS_LIBXRENDER )
set(CONAN_RES_DIRS_LIBXRENDER )
set(CONAN_SRC_DIRS_LIBXRENDER )
set(CONAN_BUILD_DIRS_LIBXRENDER "/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/"
			"/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXRENDER )
set(CONAN_LIBS_LIBXRENDER Xrender)
set(CONAN_PKG_LIBS_LIBXRENDER Xrender)
set(CONAN_SYSTEM_LIBS_LIBXRENDER )
set(CONAN_FRAMEWORKS_LIBXRENDER )
set(CONAN_FRAMEWORKS_FOUND_LIBXRENDER "")  # Will be filled later
set(CONAN_DEFINES_LIBXRENDER )
set(CONAN_BUILD_MODULES_PATHS_LIBXRENDER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXRENDER )

set(CONAN_C_FLAGS_LIBXRENDER "")
set(CONAN_CXX_FLAGS_LIBXRENDER "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXRENDER "")
set(CONAN_EXE_LINKER_FLAGS_LIBXRENDER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXRENDER_LIST "")
set(CONAN_CXX_FLAGS_LIBXRENDER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXRENDER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXRENDER "${CONAN_FRAMEWORKS_LIBXRENDER}" "_LIBXRENDER" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXRENDER ${CONAN_PKG_LIBS_LIBXRENDER} ${CONAN_SYSTEM_LIBS_LIBXRENDER} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER})


#################
###  XORG
#################
set(CONAN_XORG_ROOT "/home/mschmerber/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XORG "/usr/include/freetype2"
			"/usr/include/libpng16"
			"/usr/include/uuid")
set(CONAN_LIB_DIRS_XORG )
set(CONAN_BIN_DIRS_XORG )
set(CONAN_RES_DIRS_XORG )
set(CONAN_SRC_DIRS_XORG )
set(CONAN_BUILD_DIRS_XORG "/home/mschmerber/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_XORG )
set(CONAN_LIBS_XORG )
set(CONAN_PKG_LIBS_XORG )
set(CONAN_SYSTEM_LIBS_XORG X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama)
set(CONAN_FRAMEWORKS_XORG )
set(CONAN_FRAMEWORKS_FOUND_XORG "")  # Will be filled later
set(CONAN_DEFINES_XORG "-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT")
set(CONAN_BUILD_MODULES_PATHS_XORG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XORG "_DEFAULT_SOURCE"
			"_BSD_SOURCE"
			"HAS_FCHOWN"
			"HAS_STICKY_DIR_BIT")

set(CONAN_C_FLAGS_XORG "")
set(CONAN_CXX_FLAGS_XORG "")
set(CONAN_SHARED_LINKER_FLAGS_XORG "")
set(CONAN_EXE_LINKER_FLAGS_XORG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XORG_LIST "")
set(CONAN_CXX_FLAGS_XORG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XORG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XORG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XORG "${CONAN_FRAMEWORKS_XORG}" "_XORG" "")
# Append to aggregated values variable
set(CONAN_LIBS_XORG ${CONAN_PKG_LIBS_XORG} ${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG})


#################
###  LIBFFI
#################
set(CONAN_LIBFFI_ROOT "/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBFFI "/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_LIBFFI "/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBFFI )
set(CONAN_RES_DIRS_LIBFFI )
set(CONAN_SRC_DIRS_LIBFFI )
set(CONAN_BUILD_DIRS_LIBFFI "/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBFFI )
set(CONAN_LIBS_LIBFFI ffi)
set(CONAN_PKG_LIBS_LIBFFI ffi)
set(CONAN_SYSTEM_LIBS_LIBFFI )
set(CONAN_FRAMEWORKS_LIBFFI )
set(CONAN_FRAMEWORKS_FOUND_LIBFFI "")  # Will be filled later
set(CONAN_DEFINES_LIBFFI "-DFFI_BUILDING")
set(CONAN_BUILD_MODULES_PATHS_LIBFFI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBFFI "FFI_BUILDING")

set(CONAN_C_FLAGS_LIBFFI "")
set(CONAN_CXX_FLAGS_LIBFFI "")
set(CONAN_SHARED_LINKER_FLAGS_LIBFFI "")
set(CONAN_EXE_LINKER_FLAGS_LIBFFI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBFFI_LIST "")
set(CONAN_CXX_FLAGS_LIBFFI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBFFI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBFFI "${CONAN_FRAMEWORKS_LIBFFI}" "_LIBFFI" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBFFI ${CONAN_PKG_LIBS_LIBFFI} ${CONAN_SYSTEM_LIBS_LIBFFI} ${CONAN_FRAMEWORKS_FOUND_LIBFFI})


#################
###  PCRE
#################
set(CONAN_PCRE_ROOT "/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283")
set(CONAN_INCLUDE_DIRS_PCRE "/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/include")
set(CONAN_LIB_DIRS_PCRE "/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/lib")
set(CONAN_BIN_DIRS_PCRE "/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/bin")
set(CONAN_RES_DIRS_PCRE )
set(CONAN_SRC_DIRS_PCRE )
set(CONAN_BUILD_DIRS_PCRE "/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/")
set(CONAN_FRAMEWORK_DIRS_PCRE )
set(CONAN_LIBS_PCRE pcreposix pcre pcre16 pcre32)
set(CONAN_PKG_LIBS_PCRE pcreposix pcre pcre16 pcre32)
set(CONAN_SYSTEM_LIBS_PCRE )
set(CONAN_FRAMEWORKS_PCRE )
set(CONAN_FRAMEWORKS_FOUND_PCRE "")  # Will be filled later
set(CONAN_DEFINES_PCRE "-DPCRE_STATIC=1")
set(CONAN_BUILD_MODULES_PATHS_PCRE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE "PCRE_STATIC=1")

set(CONAN_C_FLAGS_PCRE "")
set(CONAN_CXX_FLAGS_PCRE "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE "")
set(CONAN_EXE_LINKER_FLAGS_PCRE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE_LIST "")
set(CONAN_CXX_FLAGS_PCRE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE "${CONAN_FRAMEWORKS_PCRE}" "_PCRE" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE ${CONAN_PKG_LIBS_PCRE} ${CONAN_SYSTEM_LIBS_PCRE} ${CONAN_FRAMEWORKS_FOUND_PCRE})


#################
###  LIBELF
#################
set(CONAN_LIBELF_ROOT "/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBELF "/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_LIBELF "/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBELF )
set(CONAN_RES_DIRS_LIBELF )
set(CONAN_SRC_DIRS_LIBELF )
set(CONAN_BUILD_DIRS_LIBELF "/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBELF )
set(CONAN_LIBS_LIBELF elf)
set(CONAN_PKG_LIBS_LIBELF elf)
set(CONAN_SYSTEM_LIBS_LIBELF )
set(CONAN_FRAMEWORKS_LIBELF )
set(CONAN_FRAMEWORKS_FOUND_LIBELF "")  # Will be filled later
set(CONAN_DEFINES_LIBELF )
set(CONAN_BUILD_MODULES_PATHS_LIBELF )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBELF )

set(CONAN_C_FLAGS_LIBELF "")
set(CONAN_CXX_FLAGS_LIBELF "")
set(CONAN_SHARED_LINKER_FLAGS_LIBELF "")
set(CONAN_EXE_LINKER_FLAGS_LIBELF "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBELF_LIST "")
set(CONAN_CXX_FLAGS_LIBELF_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBELF_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBELF "${CONAN_FRAMEWORKS_LIBELF}" "_LIBELF" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBELF ${CONAN_PKG_LIBS_LIBELF} ${CONAN_SYSTEM_LIBS_LIBELF} ${CONAN_FRAMEWORKS_FOUND_LIBELF})


#################
###  LIBMOUNT
#################
set(CONAN_LIBMOUNT_ROOT "/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_LIBMOUNT "/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/libmount")
set(CONAN_LIB_DIRS_LIBMOUNT "/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_LIBMOUNT )
set(CONAN_RES_DIRS_LIBMOUNT )
set(CONAN_SRC_DIRS_LIBMOUNT )
set(CONAN_BUILD_DIRS_LIBMOUNT "/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_LIBMOUNT )
set(CONAN_LIBS_LIBMOUNT mount blkid)
set(CONAN_PKG_LIBS_LIBMOUNT mount blkid)
set(CONAN_SYSTEM_LIBS_LIBMOUNT )
set(CONAN_FRAMEWORKS_LIBMOUNT )
set(CONAN_FRAMEWORKS_FOUND_LIBMOUNT "")  # Will be filled later
set(CONAN_DEFINES_LIBMOUNT )
set(CONAN_BUILD_MODULES_PATHS_LIBMOUNT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBMOUNT )

set(CONAN_C_FLAGS_LIBMOUNT "")
set(CONAN_CXX_FLAGS_LIBMOUNT "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMOUNT "")
set(CONAN_EXE_LINKER_FLAGS_LIBMOUNT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBMOUNT_LIST "")
set(CONAN_CXX_FLAGS_LIBMOUNT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBMOUNT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBMOUNT "${CONAN_FRAMEWORKS_LIBMOUNT}" "_LIBMOUNT" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBMOUNT ${CONAN_PKG_LIBS_LIBMOUNT} ${CONAN_SYSTEM_LIBS_LIBMOUNT} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT})


#################
###  LIBSELINUX
#################
set(CONAN_LIBSELINUX_ROOT "/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d")
set(CONAN_INCLUDE_DIRS_LIBSELINUX "/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/include")
set(CONAN_LIB_DIRS_LIBSELINUX "/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/lib")
set(CONAN_BIN_DIRS_LIBSELINUX )
set(CONAN_RES_DIRS_LIBSELINUX )
set(CONAN_SRC_DIRS_LIBSELINUX )
set(CONAN_BUILD_DIRS_LIBSELINUX "/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/")
set(CONAN_FRAMEWORK_DIRS_LIBSELINUX )
set(CONAN_LIBS_LIBSELINUX selinux sepol)
set(CONAN_PKG_LIBS_LIBSELINUX selinux sepol)
set(CONAN_SYSTEM_LIBS_LIBSELINUX )
set(CONAN_FRAMEWORKS_LIBSELINUX )
set(CONAN_FRAMEWORKS_FOUND_LIBSELINUX "")  # Will be filled later
set(CONAN_DEFINES_LIBSELINUX )
set(CONAN_BUILD_MODULES_PATHS_LIBSELINUX )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBSELINUX )

set(CONAN_C_FLAGS_LIBSELINUX "")
set(CONAN_CXX_FLAGS_LIBSELINUX "")
set(CONAN_SHARED_LINKER_FLAGS_LIBSELINUX "")
set(CONAN_EXE_LINKER_FLAGS_LIBSELINUX "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBSELINUX_LIST "")
set(CONAN_CXX_FLAGS_LIBSELINUX_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBSELINUX_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBSELINUX "${CONAN_FRAMEWORKS_LIBSELINUX}" "_LIBSELINUX" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBSELINUX ${CONAN_PKG_LIBS_LIBSELINUX} ${CONAN_SYSTEM_LIBS_LIBSELINUX} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX})


#################
###  LIBPNG
#################
set(CONAN_LIBPNG_ROOT "/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6")
set(CONAN_INCLUDE_DIRS_LIBPNG "/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/include")
set(CONAN_LIB_DIRS_LIBPNG "/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/lib")
set(CONAN_BIN_DIRS_LIBPNG "/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/bin")
set(CONAN_RES_DIRS_LIBPNG )
set(CONAN_SRC_DIRS_LIBPNG )
set(CONAN_BUILD_DIRS_LIBPNG "/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/")
set(CONAN_FRAMEWORK_DIRS_LIBPNG )
set(CONAN_LIBS_LIBPNG png16)
set(CONAN_PKG_LIBS_LIBPNG png16)
set(CONAN_SYSTEM_LIBS_LIBPNG m)
set(CONAN_FRAMEWORKS_LIBPNG )
set(CONAN_FRAMEWORKS_FOUND_LIBPNG "")  # Will be filled later
set(CONAN_DEFINES_LIBPNG )
set(CONAN_BUILD_MODULES_PATHS_LIBPNG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPNG )

set(CONAN_C_FLAGS_LIBPNG "")
set(CONAN_CXX_FLAGS_LIBPNG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPNG_LIST "")
set(CONAN_CXX_FLAGS_LIBPNG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPNG "${CONAN_FRAMEWORKS_LIBPNG}" "_LIBPNG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})


#################
###  LIBX11
#################
set(CONAN_LIBX11_ROOT "/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e")
set(CONAN_INCLUDE_DIRS_LIBX11 "/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/include")
set(CONAN_LIB_DIRS_LIBX11 "/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/lib")
set(CONAN_BIN_DIRS_LIBX11 )
set(CONAN_RES_DIRS_LIBX11 )
set(CONAN_SRC_DIRS_LIBX11 )
set(CONAN_BUILD_DIRS_LIBX11 "/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/"
			"/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBX11 )
set(CONAN_LIBS_LIBX11 X11)
set(CONAN_PKG_LIBS_LIBX11 X11)
set(CONAN_SYSTEM_LIBS_LIBX11 dl)
set(CONAN_FRAMEWORKS_LIBX11 )
set(CONAN_FRAMEWORKS_FOUND_LIBX11 "")  # Will be filled later
set(CONAN_DEFINES_LIBX11 )
set(CONAN_BUILD_MODULES_PATHS_LIBX11 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBX11 )

set(CONAN_C_FLAGS_LIBX11 "")
set(CONAN_CXX_FLAGS_LIBX11 "")
set(CONAN_SHARED_LINKER_FLAGS_LIBX11 "")
set(CONAN_EXE_LINKER_FLAGS_LIBX11 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBX11_LIST "")
set(CONAN_CXX_FLAGS_LIBX11_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBX11_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBX11_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBX11 "${CONAN_FRAMEWORKS_LIBX11}" "_LIBX11" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBX11 ${CONAN_PKG_LIBS_LIBX11} ${CONAN_SYSTEM_LIBS_LIBX11} ${CONAN_FRAMEWORKS_FOUND_LIBX11})


#################
###  PCRE2
#################
set(CONAN_PCRE2_ROOT "/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626")
set(CONAN_INCLUDE_DIRS_PCRE2 "/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/include")
set(CONAN_LIB_DIRS_PCRE2 "/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/lib")
set(CONAN_BIN_DIRS_PCRE2 "/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/bin")
set(CONAN_RES_DIRS_PCRE2 )
set(CONAN_SRC_DIRS_PCRE2 )
set(CONAN_BUILD_DIRS_PCRE2 "/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/")
set(CONAN_FRAMEWORK_DIRS_PCRE2 )
set(CONAN_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_PKG_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_SYSTEM_LIBS_PCRE2 )
set(CONAN_FRAMEWORKS_PCRE2 )
set(CONAN_FRAMEWORKS_FOUND_PCRE2 "")  # Will be filled later
set(CONAN_DEFINES_PCRE2 "-DPCRE2_STATIC")
set(CONAN_BUILD_MODULES_PATHS_PCRE2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE2 "PCRE2_STATIC")

set(CONAN_C_FLAGS_PCRE2 "")
set(CONAN_CXX_FLAGS_PCRE2 "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2 "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE2_LIST "")
set(CONAN_CXX_FLAGS_PCRE2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE2 "${CONAN_FRAMEWORKS_PCRE2}" "_PCRE2" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE2 ${CONAN_PKG_LIBS_PCRE2} ${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2})


#################
###  LIBXCB
#################
set(CONAN_LIBXCB_ROOT "/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39")
set(CONAN_INCLUDE_DIRS_LIBXCB "/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/include")
set(CONAN_LIB_DIRS_LIBXCB "/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/lib")
set(CONAN_BIN_DIRS_LIBXCB )
set(CONAN_RES_DIRS_LIBXCB )
set(CONAN_SRC_DIRS_LIBXCB )
set(CONAN_BUILD_DIRS_LIBXCB "/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/"
			"/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXCB )
set(CONAN_LIBS_LIBXCB xcb)
set(CONAN_PKG_LIBS_LIBXCB xcb)
set(CONAN_SYSTEM_LIBS_LIBXCB )
set(CONAN_FRAMEWORKS_LIBXCB )
set(CONAN_FRAMEWORKS_FOUND_LIBXCB "")  # Will be filled later
set(CONAN_DEFINES_LIBXCB )
set(CONAN_BUILD_MODULES_PATHS_LIBXCB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXCB )

set(CONAN_C_FLAGS_LIBXCB "")
set(CONAN_CXX_FLAGS_LIBXCB "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXCB "")
set(CONAN_EXE_LINKER_FLAGS_LIBXCB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXCB_LIST "")
set(CONAN_CXX_FLAGS_LIBXCB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXCB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXCB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXCB "${CONAN_FRAMEWORKS_LIBXCB}" "_LIBXCB" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXCB ${CONAN_PKG_LIBS_LIBXCB} ${CONAN_SYSTEM_LIBS_LIBXCB} ${CONAN_FRAMEWORKS_FOUND_LIBXCB})


#################
###  XTRANS
#################
set(CONAN_XTRANS_ROOT "/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XTRANS "/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_XTRANS )
set(CONAN_BIN_DIRS_XTRANS )
set(CONAN_RES_DIRS_XTRANS )
set(CONAN_SRC_DIRS_XTRANS )
set(CONAN_BUILD_DIRS_XTRANS "/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XTRANS )
set(CONAN_LIBS_XTRANS )
set(CONAN_PKG_LIBS_XTRANS )
set(CONAN_SYSTEM_LIBS_XTRANS )
set(CONAN_FRAMEWORKS_XTRANS )
set(CONAN_FRAMEWORKS_FOUND_XTRANS "")  # Will be filled later
set(CONAN_DEFINES_XTRANS )
set(CONAN_BUILD_MODULES_PATHS_XTRANS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XTRANS )

set(CONAN_C_FLAGS_XTRANS "")
set(CONAN_CXX_FLAGS_XTRANS "")
set(CONAN_SHARED_LINKER_FLAGS_XTRANS "")
set(CONAN_EXE_LINKER_FLAGS_XTRANS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XTRANS_LIST "")
set(CONAN_CXX_FLAGS_XTRANS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XTRANS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XTRANS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XTRANS "${CONAN_FRAMEWORKS_XTRANS}" "_XTRANS" "")
# Append to aggregated values variable
set(CONAN_LIBS_XTRANS ${CONAN_PKG_LIBS_XTRANS} ${CONAN_SYSTEM_LIBS_XTRANS} ${CONAN_FRAMEWORKS_FOUND_XTRANS})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a")
set(CONAN_INCLUDE_DIRS_ZLIB "/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include")
set(CONAN_LIB_DIRS_ZLIB "/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d")
set(CONAN_INCLUDE_DIRS_BZIP2 "/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/include")
set(CONAN_LIB_DIRS_BZIP2 "/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/lib")
set(CONAN_BIN_DIRS_BZIP2 "/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


#################
###  XCB-PROTO
#################
set(CONAN_XCB-PROTO_ROOT "/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XCB-PROTO )
set(CONAN_LIB_DIRS_XCB-PROTO "/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib")
set(CONAN_BIN_DIRS_XCB-PROTO )
set(CONAN_RES_DIRS_XCB-PROTO )
set(CONAN_SRC_DIRS_XCB-PROTO )
set(CONAN_BUILD_DIRS_XCB-PROTO "/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XCB-PROTO )
set(CONAN_LIBS_XCB-PROTO )
set(CONAN_PKG_LIBS_XCB-PROTO )
set(CONAN_SYSTEM_LIBS_XCB-PROTO )
set(CONAN_FRAMEWORKS_XCB-PROTO )
set(CONAN_FRAMEWORKS_FOUND_XCB-PROTO "")  # Will be filled later
set(CONAN_DEFINES_XCB-PROTO )
set(CONAN_BUILD_MODULES_PATHS_XCB-PROTO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XCB-PROTO )

set(CONAN_C_FLAGS_XCB-PROTO "")
set(CONAN_CXX_FLAGS_XCB-PROTO "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-PROTO "")
set(CONAN_EXE_LINKER_FLAGS_XCB-PROTO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XCB-PROTO_LIST "")
set(CONAN_CXX_FLAGS_XCB-PROTO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XCB-PROTO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XCB-PROTO "${CONAN_FRAMEWORKS_XCB-PROTO}" "_XCB-PROTO" "")
# Append to aggregated values variable
set(CONAN_LIBS_XCB-PROTO ${CONAN_PKG_LIBS_XCB-PROTO} ${CONAN_SYSTEM_LIBS_XCB-PROTO} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO})


#################
###  UTIL-MACROS
#################
set(CONAN_UTIL-MACROS_ROOT "/home/mschmerber/.conan/data/util-macros/1.19.2/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_UTIL-MACROS )
set(CONAN_LIB_DIRS_UTIL-MACROS )
set(CONAN_BIN_DIRS_UTIL-MACROS )
set(CONAN_RES_DIRS_UTIL-MACROS )
set(CONAN_SRC_DIRS_UTIL-MACROS )
set(CONAN_BUILD_DIRS_UTIL-MACROS "/home/mschmerber/.conan/data/util-macros/1.19.2/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/util-macros/1.19.2/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_UTIL-MACROS )
set(CONAN_LIBS_UTIL-MACROS )
set(CONAN_PKG_LIBS_UTIL-MACROS )
set(CONAN_SYSTEM_LIBS_UTIL-MACROS )
set(CONAN_FRAMEWORKS_UTIL-MACROS )
set(CONAN_FRAMEWORKS_FOUND_UTIL-MACROS "")  # Will be filled later
set(CONAN_DEFINES_UTIL-MACROS )
set(CONAN_BUILD_MODULES_PATHS_UTIL-MACROS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_UTIL-MACROS )

set(CONAN_C_FLAGS_UTIL-MACROS "")
set(CONAN_CXX_FLAGS_UTIL-MACROS "")
set(CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS "")
set(CONAN_EXE_LINKER_FLAGS_UTIL-MACROS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_UTIL-MACROS_LIST "")
set(CONAN_CXX_FLAGS_UTIL-MACROS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_UTIL-MACROS "${CONAN_FRAMEWORKS_UTIL-MACROS}" "_UTIL-MACROS" "")
# Append to aggregated values variable
set(CONAN_LIBS_UTIL-MACROS ${CONAN_PKG_LIBS_UTIL-MACROS} ${CONAN_SYSTEM_LIBS_UTIL-MACROS} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS})


#################
###  LIBXAU
#################
set(CONAN_LIBXAU_ROOT "/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d")
set(CONAN_INCLUDE_DIRS_LIBXAU "/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/include")
set(CONAN_LIB_DIRS_LIBXAU "/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/lib")
set(CONAN_BIN_DIRS_LIBXAU )
set(CONAN_RES_DIRS_LIBXAU )
set(CONAN_SRC_DIRS_LIBXAU )
set(CONAN_BUILD_DIRS_LIBXAU "/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/"
			"/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXAU )
set(CONAN_LIBS_LIBXAU Xau)
set(CONAN_PKG_LIBS_LIBXAU Xau)
set(CONAN_SYSTEM_LIBS_LIBXAU )
set(CONAN_FRAMEWORKS_LIBXAU )
set(CONAN_FRAMEWORKS_FOUND_LIBXAU "")  # Will be filled later
set(CONAN_DEFINES_LIBXAU )
set(CONAN_BUILD_MODULES_PATHS_LIBXAU )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXAU )

set(CONAN_C_FLAGS_LIBXAU "")
set(CONAN_CXX_FLAGS_LIBXAU "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXAU "")
set(CONAN_EXE_LINKER_FLAGS_LIBXAU "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXAU_LIST "")
set(CONAN_CXX_FLAGS_LIBXAU_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXAU_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXAU_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXAU "${CONAN_FRAMEWORKS_LIBXAU}" "_LIBXAU" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXAU ${CONAN_PKG_LIBS_LIBXAU} ${CONAN_SYSTEM_LIBS_LIBXAU} ${CONAN_FRAMEWORKS_FOUND_LIBXAU})


#################
###  LIBPTHREAD-STUBS
#################
set(CONAN_LIBPTHREAD-STUBS_ROOT "/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS )
set(CONAN_LIB_DIRS_LIBPTHREAD-STUBS "/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib")
set(CONAN_BIN_DIRS_LIBPTHREAD-STUBS )
set(CONAN_RES_DIRS_LIBPTHREAD-STUBS )
set(CONAN_SRC_DIRS_LIBPTHREAD-STUBS )
set(CONAN_BUILD_DIRS_LIBPTHREAD-STUBS "/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBPTHREAD-STUBS )
set(CONAN_LIBS_LIBPTHREAD-STUBS )
set(CONAN_PKG_LIBS_LIBPTHREAD-STUBS )
set(CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS )
set(CONAN_FRAMEWORKS_LIBPTHREAD-STUBS )
set(CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS "")  # Will be filled later
set(CONAN_DEFINES_LIBPTHREAD-STUBS )
set(CONAN_BUILD_MODULES_PATHS_LIBPTHREAD-STUBS )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS )

set(CONAN_C_FLAGS_LIBPTHREAD-STUBS "")
set(CONAN_CXX_FLAGS_LIBPTHREAD-STUBS "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS "")
set(CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPTHREAD-STUBS_LIST "")
set(CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS "${CONAN_FRAMEWORKS_LIBPTHREAD-STUBS}" "_LIBPTHREAD-STUBS" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPTHREAD-STUBS ${CONAN_PKG_LIBS_LIBPTHREAD-STUBS} ${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS})


#################
###  LIBXDMCP
#################
set(CONAN_LIBXDMCP_ROOT "/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b")
set(CONAN_INCLUDE_DIRS_LIBXDMCP "/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/include")
set(CONAN_LIB_DIRS_LIBXDMCP "/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/lib")
set(CONAN_BIN_DIRS_LIBXDMCP )
set(CONAN_RES_DIRS_LIBXDMCP )
set(CONAN_SRC_DIRS_LIBXDMCP )
set(CONAN_BUILD_DIRS_LIBXDMCP "/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/"
			"/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_LIBXDMCP )
set(CONAN_LIBS_LIBXDMCP Xdmcp)
set(CONAN_PKG_LIBS_LIBXDMCP Xdmcp)
set(CONAN_SYSTEM_LIBS_LIBXDMCP )
set(CONAN_FRAMEWORKS_LIBXDMCP )
set(CONAN_FRAMEWORKS_FOUND_LIBXDMCP "")  # Will be filled later
set(CONAN_DEFINES_LIBXDMCP )
set(CONAN_BUILD_MODULES_PATHS_LIBXDMCP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXDMCP )

set(CONAN_C_FLAGS_LIBXDMCP "")
set(CONAN_CXX_FLAGS_LIBXDMCP "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXDMCP "")
set(CONAN_EXE_LINKER_FLAGS_LIBXDMCP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXDMCP_LIST "")
set(CONAN_CXX_FLAGS_LIBXDMCP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXDMCP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXDMCP "${CONAN_FRAMEWORKS_LIBXDMCP}" "_LIBXDMCP" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXDMCP ${CONAN_PKG_LIBS_LIBXDMCP} ${CONAN_SYSTEM_LIBS_LIBXDMCP} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP})


#################
###  XORGPROTO
#################
set(CONAN_XORGPROTO_ROOT "/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XORGPROTO "/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_XORGPROTO )
set(CONAN_BIN_DIRS_XORGPROTO )
set(CONAN_RES_DIRS_XORGPROTO )
set(CONAN_SRC_DIRS_XORGPROTO )
set(CONAN_BUILD_DIRS_XORGPROTO "/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XORGPROTO )
set(CONAN_LIBS_XORGPROTO )
set(CONAN_PKG_LIBS_XORGPROTO )
set(CONAN_SYSTEM_LIBS_XORGPROTO )
set(CONAN_FRAMEWORKS_XORGPROTO )
set(CONAN_FRAMEWORKS_FOUND_XORGPROTO "")  # Will be filled later
set(CONAN_DEFINES_XORGPROTO )
set(CONAN_BUILD_MODULES_PATHS_XORGPROTO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XORGPROTO )

set(CONAN_C_FLAGS_XORGPROTO "")
set(CONAN_CXX_FLAGS_XORGPROTO "")
set(CONAN_SHARED_LINKER_FLAGS_XORGPROTO "")
set(CONAN_EXE_LINKER_FLAGS_XORGPROTO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XORGPROTO_LIST "")
set(CONAN_CXX_FLAGS_XORGPROTO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XORGPROTO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XORGPROTO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XORGPROTO "${CONAN_FRAMEWORKS_XORGPROTO}" "_XORGPROTO" "")
# Append to aggregated values variable
set(CONAN_LIBS_XORGPROTO ${CONAN_PKG_LIBS_XORGPROTO} ${CONAN_SYSTEM_LIBS_XORGPROTO} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO})


#################
###  XPROTO
#################
set(CONAN_XPROTO_ROOT "/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XPROTO "/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_XPROTO "/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib")
set(CONAN_BIN_DIRS_XPROTO )
set(CONAN_RES_DIRS_XPROTO )
set(CONAN_SRC_DIRS_XPROTO )
set(CONAN_BUILD_DIRS_XPROTO "/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig")
set(CONAN_FRAMEWORK_DIRS_XPROTO )
set(CONAN_LIBS_XPROTO )
set(CONAN_PKG_LIBS_XPROTO )
set(CONAN_SYSTEM_LIBS_XPROTO )
set(CONAN_FRAMEWORKS_XPROTO )
set(CONAN_FRAMEWORKS_FOUND_XPROTO "")  # Will be filled later
set(CONAN_DEFINES_XPROTO )
set(CONAN_BUILD_MODULES_PATHS_XPROTO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XPROTO )

set(CONAN_C_FLAGS_XPROTO "")
set(CONAN_CXX_FLAGS_XPROTO "")
set(CONAN_SHARED_LINKER_FLAGS_XPROTO "")
set(CONAN_EXE_LINKER_FLAGS_XPROTO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XPROTO_LIST "")
set(CONAN_CXX_FLAGS_XPROTO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XPROTO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XPROTO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XPROTO "${CONAN_FRAMEWORKS_XPROTO}" "_XPROTO" "")
# Append to aggregated values variable
set(CONAN_LIBS_XPROTO ${CONAN_PKG_LIBS_XPROTO} ${CONAN_SYSTEM_LIBS_XPROTO} ${CONAN_FRAMEWORKS_FOUND_XPROTO})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "gcc")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libstdc++11")
set(CONAN_SETTINGS_COMPILER_VERSION "8")
set(CONAN_SETTINGS_OS "Linux")
set(CONAN_SETTINGS_OS_BUILD "Linux")

set(CONAN_DEPENDENCIES qt portaudio opus double-conversion fontconfig icu harfbuzz libjpeg sqlite3 libmysqlclient libpq odbc xcb-util-keysyms xcb-util-renderutil xcb-util-wm xcb-util-image libxcursor xkbcommon zstd opengl libalsa openssl glib freetype expat libuuid libiconv xcb-util libxfixes libxrender xorg libffi pcre libelf libmount libselinux libpng libx11 pcre2 libxcb xtrans zlib bzip2 xcb-proto util-macros libxau libpthread-stubs libxdmcp xorgproto xproto)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/include"
			"/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/include"
			"/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/opus"
			"/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/include"
			"/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/include"
			"/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/include"
			"/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/include"
			"/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/include/harfbuzz"
			"/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/include"
			"/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/include"
			"/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/include"
			"/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/include"
			"/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include"
			"/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include"
			"/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include"
			"/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/include"
			"/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/include"
			"/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/include"
			"/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/include"
			"/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/include"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/include/glib-2.0"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/lib/glib-2.0/include"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/include"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/include/freetype2"
			"/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/uuid"
			"/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/include"
			"/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/include"
			"/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/include"
			"/usr/include/freetype2"
			"/usr/include/libpng16"
			"/usr/include/uuid"
			"/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/include"
			"/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include/libmount"
			"/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/include"
			"/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/include"
			"/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/include"
			"/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/include"
			"/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/include"
			"/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/include"
			"/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/include"
			"/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/include"
			"/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/include"
			"/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/lib"
			"/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/lib"
			"/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/lib"
			"/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/lib"
			"/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/lib"
			"/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/lib"
			"/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/lib"
			"/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/lib"
			"/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/lib"
			"/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/lib"
			"/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib"
			"/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib"
			"/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib"
			"/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/lib"
			"/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/lib"
			"/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/lib"
			"/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/lib"
			"/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/lib"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/lib"
			"/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib"
			"/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib"
			"/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib"
			"/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/lib"
			"/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/lib"
			"/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/lib"
			"/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/lib"
			"/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/lib"
			"/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/lib"
			"/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/lib"
			"/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/lib"
			"/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib"
			"/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/lib"
			"/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib"
			"/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/lib"
			"/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/bin"
			"/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/bin"
			"/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/bin"
			"/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin"
			"/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/bin"
			"/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/bin"
			"/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/bin"
			"/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/bin"
			"/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/bin"
			"/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/bin"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/bin"
			"/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/bin"
			"/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/bin"
			"/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/bin"
			"/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/bin"
			"/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS portaudio opus double-conversion fontconfig m pthread icuio icutest icutu icui18n icuuc icudata harfbuzz jpeg sqlite3 mysqlclient pq pgcommon odbc odbccr odbcinst ltdl dl xcb-keysyms xcb-render-util xcb-ewmh xcb-icccm xcb-image Xcursor xkbcommon xkbcommon-x11 zstd asound ssl crypto gio-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 glib-2.0 freetype expat uuid iconv charset xcb-util Xfixes Xrender ffi pcreposix pcre pcre16 pcre32 elf mount blkid selinux sepol png16 X11 pcre2-posix pcre2-8 pcre2-16 pcre2-32 xcb z bz2 Xau Xdmcp ${CONAN_LIBS})
set(CONAN_PKG_LIBS portaudio opus double-conversion fontconfig m pthread icuio icutest icutu icui18n icuuc icudata harfbuzz jpeg sqlite3 mysqlclient pq pgcommon odbc odbccr odbcinst ltdl dl xcb-keysyms xcb-render-util xcb-ewmh xcb-icccm xcb-image Xcursor xkbcommon xkbcommon-x11 zstd asound ssl crypto gio-2.0 gmodule-2.0 gobject-2.0 gthread-2.0 glib-2.0 freetype expat uuid iconv charset xcb-util Xfixes Xrender ffi pcreposix pcre pcre16 pcre32 elf mount blkid selinux sepol png16 X11 pcre2-posix pcre2-8 pcre2-16 pcre2-32 xcb z bz2 Xau Xdmcp ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS jack stdc++ GL rt pthread resolv X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama m dl ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DPCRE2_STATIC"
			"-DPCRE_STATIC=1"
			"-DFFI_BUILDING"
			"-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT"
			"-DXML_STATIC"
			"-DLIBJPEG_STATIC"
			"-DU_STATIC_IMPLEMENTATION" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/home/mschmerber/.conan/data/qt/5.14.2/bincrafters/stable/package/c3f3f20c45e3079cce7c13faf8ee7065a09801b5/"
			"/home/mschmerber/.conan/data/portaudio/v190600.20161030/bincrafters/stable/package/bc30f8bb92330bc948ae824195a3d1fb77ab6967/"
			"/home/mschmerber/.conan/data/opus/1.3.1/bincrafters/stable/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/double-conversion/3.1.5/_/_/package/56e0cf6d16ee57367a0661ab743f4e43b29223f8/"
			"/home/mschmerber/.conan/data/fontconfig/2.13.91/conan/stable/package/ba912f03096da1fe021c3e22fbd5c20f345e0179/"
			"/home/mschmerber/.conan/data/icu/64.2/_/_/package/e04d911084321fe690e4c11d7d2fb87a99d1ca1d/"
			"/home/mschmerber/.conan/data/harfbuzz/2.6.4/bincrafters/stable/package/34618646c1e18795d770213d1ab6409afce09204/"
			"/home/mschmerber/.conan/data/libjpeg/9d/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/sqlite3/3.31.0/_/_/package/38f535feecc967fe90f2e9f3433bfc518b9f5a94/"
			"/home/mschmerber/.conan/data/libmysqlclient/8.0.17/_/_/package/d0971ea66a27756acbf4cd00b51dd89e43beda0f/"
			"/home/mschmerber/.conan/data/libpq/11.5/_/_/package/7272758eb3859d8cadc85d3af3bb16905c17893d/"
			"/home/mschmerber/.conan/data/odbc/2.3.7/_/_/package/2a982b92ac81c03d30ac3a7ea4fdb8a221e00522/"
			"/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/"
			"/home/mschmerber/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/9034079fdc869bc7df1be3aa2ab3504b9daf2448/lib/pkgconfig"
			"/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/"
			"/home/mschmerber/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/127bbe8693e5e34a1bf2bcfc4a2047fb4d032343/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xkbcommon/0.10.0/bincrafters/stable/package/f5baae97e3c61790f5330ad68ca6e290e491bb78/"
			"/home/mschmerber/.conan/data/zstd/1.4.4/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/opengl/virtual/bincrafters/stable/package/25315d66e1f567146d60eadc7d8fc22e5398fdaf/"
			"/home/mschmerber/.conan/data/libalsa/1.1.9/_/_/package/7cf43daaf95399d6202b2fd6fab7eab428e8d639/"
			"/home/mschmerber/.conan/data/openssl/1.1.1g/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/glib/2.64.0/bincrafters/stable/package/59bb10bbde5a7ccc53d0b97d5f489af4069a6b81/"
			"/home/mschmerber/.conan/data/freetype/2.10.1/_/_/package/876d4331adf573973aca1cbdf6614fdd41b8c51e/"
			"/home/mschmerber/.conan/data/expat/2.2.9/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/libuuid/1.0.3/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/libiconv/1.16/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/"
			"/home/mschmerber/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/2df90805ee577d7a25eeae40f683defbee161ab9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/"
			"/home/mschmerber/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib/pkgconfig"
			"/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/"
			"/home/mschmerber/.conan/data/libxrender/0.9.10/bincrafters/stable/package/0d8dd2f619dd6b0b89738f67825b6d13af0f1e3b/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/libffi/3.2.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/pcre/8.41/_/_/package/5a7bcdc5228bf78571c7f7766ea25bfc747c0283/"
			"/home/mschmerber/.conan/data/libelf/0.8.13/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/libmount/2.33.1/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/libselinux/3.0/_/_/package/3cdf9c40ed41ce093aec6e5f6607274047658b2d/"
			"/home/mschmerber/.conan/data/libpng/1.6.37/_/_/package/4f75e4b120320a9fb6ac0012242d9ac95d18b6f6/"
			"/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/"
			"/home/mschmerber/.conan/data/libx11/1.6.8/bincrafters/stable/package/850b375ef3612a164776566c2d1529fc4923366e/lib/pkgconfig"
			"/home/mschmerber/.conan/data/pcre2/10.33/_/_/package/574897e9b724d40ebb3cb36c2f1f0b1077a87626/"
			"/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/"
			"/home/mschmerber/.conan/data/libxcb/1.13.1/bincrafters/stable/package/ab9825abda22f84b85715d1d0da895754f0f1f39/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig"
			"/home/mschmerber/.conan/data/zlib/1.2.11/_/_/package/1d877a3df840030e6a8abb74c5ffb9088d08b47a/"
			"/home/mschmerber/.conan/data/bzip2/1.0.8/_/_/package/a5875aed3fc7ae8dd0488f7e5e99acbc480d721d/"
			"/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/util-macros/1.19.2/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/util-macros/1.19.2/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig"
			"/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/"
			"/home/mschmerber/.conan/data/libxau/1.0.9/bincrafters/stable/package/21ee43605964b0ba2e76b0cd1b0153072cd0869d/lib/pkgconfig"
			"/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig"
			"/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/"
			"/home/mschmerber/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/e3228917cf8c23687c447be3b3173bc2f0b3f79b/lib/pkgconfig"
			"/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/share/pkgconfig"
			"/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/mschmerber/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/pkgconfig" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::glib CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::libxcb CONAN_PKG::xcb-util CONAN_PKG::xcb-util-image CONAN_PKG::libx11 CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT}" "${CONAN_LIB_DIRS_QT}"
                                  CONAN_PACKAGE_TARGETS_QT "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}"
                                  "" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_QT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_QT_DEBUG} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::glib CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::libxcb CONAN_PKG::xcb-util CONAN_PKG::xcb-util-image CONAN_PKG::libx11 CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_DEBUG}" "${CONAN_LIB_DIRS_QT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_QT_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}"
                                  "debug" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_QT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_QT_RELEASE} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::glib CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::libxcb CONAN_PKG::xcb-util CONAN_PKG::xcb-util-image CONAN_PKG::libx11 CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELEASE}" "${CONAN_LIB_DIRS_QT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_QT_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}"
                                  "release" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_QT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_QT_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::glib CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::libxcb CONAN_PKG::xcb-util CONAN_PKG::xcb-util-image CONAN_PKG::libx11 CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_QT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_QT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_QT_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::glib CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::libxcb CONAN_PKG::xcb-util CONAN_PKG::xcb-util-image CONAN_PKG::libx11 CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_MINSIZEREL}" "${CONAN_LIB_DIRS_QT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_QT_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" qt)

    add_library(CONAN_PKG::qt INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_QT} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_QT_RELEASE} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_QT_MINSIZEREL} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_QT_DEBUG} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_QT_LIST} ${CONAN_CXX_FLAGS_QT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_QT_RELEASE_LIST} ${CONAN_CXX_FLAGS_QT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_QT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_QT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_QT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_QT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_QT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PORTAUDIO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO} CONAN_PKG::libalsa")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO}" "${CONAN_LIB_DIRS_PORTAUDIO}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}"
                                  "" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PORTAUDIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_DEBUG} CONAN_PKG::libalsa")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_DEBUG}" "${CONAN_LIB_DIRS_PORTAUDIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_DEBUG "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}"
                                  "debug" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PORTAUDIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_RELEASE} CONAN_PKG::libalsa")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_RELEASE}" "${CONAN_LIB_DIRS_PORTAUDIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_RELEASE "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}"
                                  "release" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PORTAUDIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_RELWITHDEBINFO} CONAN_PKG::libalsa")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PORTAUDIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" portaudio)
    set(_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PORTAUDIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PORTAUDIO_MINSIZEREL} CONAN_PKG::libalsa")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PORTAUDIO_MINSIZEREL}" "${CONAN_LIB_DIRS_PORTAUDIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PORTAUDIO_MINSIZEREL "${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" portaudio)

    add_library(CONAN_PKG::portaudio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PORTAUDIO} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_RELEASE} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_MINSIZEREL} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PORTAUDIO_DEBUG} ${_CONAN_PKG_LIBS_PORTAUDIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PORTAUDIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PORTAUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PORTAUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PORTAUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PORTAUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PORTAUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PORTAUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PORTAUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::portaudio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PORTAUDIO_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PORTAUDIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PORTAUDIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PORTAUDIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PORTAUDIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PORTAUDIO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPUS} ${CONAN_FRAMEWORKS_FOUND_OPUS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS}" "${CONAN_LIB_DIRS_OPUS}"
                                  CONAN_PACKAGE_TARGETS_OPUS "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}"
                                  "" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPUS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPUS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_DEBUG}" "${CONAN_LIB_DIRS_OPUS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPUS_DEBUG "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}"
                                  "debug" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPUS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPUS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_RELEASE}" "${CONAN_LIB_DIRS_OPUS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPUS_RELEASE "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}"
                                  "release" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPUS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPUS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPUS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPUS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opus)
    set(_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPUS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPUS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPUS_MINSIZEREL}" "${CONAN_LIB_DIRS_OPUS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPUS_MINSIZEREL "${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opus)

    add_library(CONAN_PKG::opus INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPUS} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPUS_RELEASE} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPUS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPUS_MINSIZEREL} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPUS_DEBUG} ${_CONAN_PKG_LIBS_OPUS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPUS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPUS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPUS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPUS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPUS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPUS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPUS_DEBUG}>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPUS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPUS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPUS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPUS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPUS_DEBUG}>)
    set_property(TARGET CONAN_PKG::opus PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPUS_LIST} ${CONAN_CXX_FLAGS_OPUS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPUS_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPUS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPUS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPUS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPUS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPUS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPUS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPUS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}"
                                  "" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEBUG}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}"
                                  "debug" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELEASE}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}"
                                  "release" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_MINSIZEREL}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" double-conversion)

    add_library(CONAN_PKG::double-conversion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FONTCONFIG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG}" "${CONAN_LIB_DIRS_FONTCONFIG}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}"
                                  "" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FONTCONFIG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_DEBUG} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_DEBUG}" "${CONAN_LIB_DIRS_FONTCONFIG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_DEBUG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}"
                                  "debug" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FONTCONFIG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_RELEASE} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_RELEASE}" "${CONAN_LIB_DIRS_FONTCONFIG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_RELEASE "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}"
                                  "release" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FONTCONFIG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_RELWITHDEBINFO} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FONTCONFIG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FONTCONFIG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_MINSIZEREL} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_MINSIZEREL}" "${CONAN_LIB_DIRS_FONTCONFIG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_MINSIZEREL "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" fontconfig)

    add_library(CONAN_PKG::fontconfig INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FONTCONFIG} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_RELEASE} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_MINSIZEREL} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_DEBUG} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FONTCONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FONTCONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FONTCONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FONTCONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FONTCONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FONTCONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FONTCONFIG_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FONTCONFIG_RELEASE_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FONTCONFIG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FONTCONFIG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FONTCONFIG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ICU} ${CONAN_FRAMEWORKS_FOUND_ICU} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU}" "${CONAN_LIB_DIRS_ICU}"
                                  CONAN_PACKAGE_TARGETS_ICU "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}"
                                  "" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ICU_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ICU_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_DEBUG}" "${CONAN_LIB_DIRS_ICU_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ICU_DEBUG "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}"
                                  "debug" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ICU_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ICU_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_RELEASE}" "${CONAN_LIB_DIRS_ICU_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ICU_RELEASE "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}"
                                  "release" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ICU_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ICU_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ICU_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ICU_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ICU_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ICU_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_MINSIZEREL}" "${CONAN_LIB_DIRS_ICU_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ICU_MINSIZEREL "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" icu)

    add_library(CONAN_PKG::icu INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ICU} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ICU_RELEASE} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ICU_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ICU_MINSIZEREL} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ICU_DEBUG} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ICU}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ICU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ICU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ICU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ICU_DEBUG}>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ICU}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ICU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ICU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ICU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ICU_DEBUG}>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ICU_LIST} ${CONAN_CXX_FLAGS_ICU_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ICU_RELEASE_LIST} ${CONAN_CXX_FLAGS_ICU_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ICU_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ICU_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ICU_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ICU_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_HARFBUZZ} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ}" "${CONAN_LIB_DIRS_HARFBUZZ}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}"
                                  "" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_HARFBUZZ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_DEBUG} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_DEBUG}" "${CONAN_LIB_DIRS_HARFBUZZ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_DEBUG "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}"
                                  "debug" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_HARFBUZZ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_RELEASE} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_RELEASE}" "${CONAN_LIB_DIRS_HARFBUZZ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_RELEASE "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}"
                                  "release" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_HARFBUZZ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_RELWITHDEBINFO} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_HARFBUZZ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" harfbuzz)
    set(_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_HARFBUZZ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_HARFBUZZ_MINSIZEREL} CONAN_PKG::freetype CONAN_PKG::glib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HARFBUZZ_MINSIZEREL}" "${CONAN_LIB_DIRS_HARFBUZZ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_HARFBUZZ_MINSIZEREL "${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" harfbuzz)

    add_library(CONAN_PKG::harfbuzz INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_HARFBUZZ} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_RELEASE} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_MINSIZEREL} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_HARFBUZZ_DEBUG} ${_CONAN_PKG_LIBS_HARFBUZZ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HARFBUZZ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_HARFBUZZ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_HARFBUZZ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_HARFBUZZ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_HARFBUZZ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_HARFBUZZ_DEBUG}>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_HARFBUZZ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_HARFBUZZ_DEBUG}>)
    set_property(TARGET CONAN_PKG::harfbuzz PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_HARFBUZZ_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_HARFBUZZ_RELEASE_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_HARFBUZZ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_HARFBUZZ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_HARFBUZZ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_HARFBUZZ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBJPEG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG}" "${CONAN_LIB_DIRS_LIBJPEG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}"
                                  "" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBJPEG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_DEBUG}" "${CONAN_LIB_DIRS_LIBJPEG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}"
                                  "debug" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBJPEG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELEASE}" "${CONAN_LIB_DIRS_LIBJPEG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}"
                                  "release" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBJPEG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBJPEG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libjpeg)
    set(_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBJPEG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBJPEG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBJPEG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBJPEG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libjpeg)

    add_library(CONAN_PKG::libjpeg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBJPEG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELEASE} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBJPEG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBJPEG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBJPEG_DEBUG} ${_CONAN_PKG_LIBS_LIBJPEG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBJPEG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBJPEG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBJPEG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libjpeg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBJPEG_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBJPEG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBJPEG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBJPEG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBJPEG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBJPEG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3}" "${CONAN_LIB_DIRS_SQLITE3}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3 "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}"
                                  "" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE3_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_DEBUG}" "${CONAN_LIB_DIRS_SQLITE3_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE3_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELEASE}" "${CONAN_LIB_DIRS_SQLITE3_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}"
                                  "release" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE3_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE3_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE3_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE3_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite3)

    add_library(CONAN_PKG::sqlite3 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE3} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE3_LIST} ${CONAN_CXX_FLAGS_SQLITE3_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE3_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE3_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE3_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE3_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE3_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT} CONAN_PKG::openssl CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}"
                                  "" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_DEBUG} CONAN_PKG::openssl CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEBUG}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_DEBUG "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}"
                                  "debug" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_RELEASE} CONAN_PKG::openssl CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_RELEASE}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELEASE "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}"
                                  "release" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_RELWITHDEBINFO} CONAN_PKG::openssl CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_MINSIZEREL} CONAN_PKG::openssl CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libmysqlclient)

    add_library(CONAN_PKG::libmysqlclient INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELEASE} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_DEBUG} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBMYSQLCLIENT_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ}" "${CONAN_LIB_DIRS_LIBPQ}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}"
                                  "" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPQ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_DEBUG}" "${CONAN_LIB_DIRS_LIBPQ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}"
                                  "debug" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPQ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELEASE}" "${CONAN_LIB_DIRS_LIBPQ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}"
                                  "release" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPQ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPQ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPQ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPQ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpq)

    add_library(CONAN_PKG::libpq INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPQ} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPQ_LIST} ${CONAN_CXX_FLAGS_LIBPQ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPQ_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPQ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPQ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPQ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPQ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC}" "${CONAN_LIB_DIRS_ODBC}"
                                  CONAN_PACKAGE_TARGETS_ODBC "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}"
                                  "" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ODBC_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ODBC_DEBUG} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_DEBUG}" "${CONAN_LIB_DIRS_ODBC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ODBC_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}"
                                  "debug" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ODBC_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELEASE} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELEASE}" "${CONAN_LIB_DIRS_ODBC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}"
                                  "release" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ODBC_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELWITHDEBINFO} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ODBC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ODBC_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ODBC_MINSIZEREL} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_MINSIZEREL}" "${CONAN_LIB_DIRS_ODBC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" odbc)

    add_library(CONAN_PKG::odbc INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ODBC} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ODBC_RELEASE} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ODBC_DEBUG} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ODBC_LIST} ${CONAN_CXX_FLAGS_ODBC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ODBC_RELEASE_LIST} ${CONAN_CXX_FLAGS_ODBC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ODBC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ODBC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ODBC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ODBC_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS}" "${CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES}"
                                  "" xcb-util-keysyms)
    set(_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS_DEBUG} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEBUG}" "${CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-util-keysyms)
    set(_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS_RELEASE} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_RELEASE}" "${CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELEASE}"
                                  "release" xcb-util-keysyms)
    set(_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS_RELWITHDEBINFO} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-util-keysyms)
    set(_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-UTIL-KEYSYMS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-KEYSYMS_MINSIZEREL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-UTIL-KEYSYMS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-util-keysyms)

    add_library(CONAN_PKG::xcb-util-keysyms INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-util-keysyms PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS} ${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_RELEASE} ${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-KEYSYMS_DEBUG} ${_CONAN_PKG_LIBS_XCB-UTIL-KEYSYMS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-KEYSYMS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-KEYSYMS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-util-keysyms PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-UTIL-KEYSYMS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-keysyms PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-KEYSYMS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-keysyms PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-UTIL-KEYSYMS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-UTIL-KEYSYMS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL}" "${CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES}"
                                  "" xcb-util-renderutil)
    set(_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL_DEBUG} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEBUG}" "${CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-util-renderutil)
    set(_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL_RELEASE} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_RELEASE}" "${CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELEASE}"
                                  "release" xcb-util-renderutil)
    set(_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-util-renderutil)
    set(_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-UTIL-RENDERUTIL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-RENDERUTIL_MINSIZEREL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-UTIL-RENDERUTIL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-util-renderutil)

    add_library(CONAN_PKG::xcb-util-renderutil INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-util-renderutil PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL} ${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_RELEASE} ${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-RENDERUTIL_DEBUG} ${_CONAN_PKG_LIBS_XCB-UTIL-RENDERUTIL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-RENDERUTIL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-util-renderutil PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-UTIL-RENDERUTIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-renderutil PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-RENDERUTIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-renderutil PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-UTIL-RENDERUTIL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-UTIL-RENDERUTIL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-UTIL-WM} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-WM}" "${CONAN_LIB_DIRS_XCB-UTIL-WM}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-WM "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES}"
                                  "" xcb-util-wm)
    set(_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-UTIL-WM_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM_DEBUG} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-WM_DEBUG}" "${CONAN_LIB_DIRS_XCB-UTIL-WM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-util-wm)
    set(_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-UTIL-WM_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM_RELEASE} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-WM_RELEASE}" "${CONAN_LIB_DIRS_XCB-UTIL-WM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELEASE}"
                                  "release" xcb-util-wm)
    set(_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-UTIL-WM_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM_RELWITHDEBINFO} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-WM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-UTIL-WM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-util-wm)
    set(_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-UTIL-WM_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-WM_MINSIZEREL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-WM_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-UTIL-WM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-util-wm)

    add_library(CONAN_PKG::xcb-util-wm INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-util-wm PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-UTIL-WM} ${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_RELEASE} ${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-WM_DEBUG} ${_CONAN_PKG_LIBS_XCB-UTIL-WM_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-WM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-WM_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-util-wm PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-UTIL-WM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-UTIL-WM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-UTIL-WM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-UTIL-WM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-UTIL-WM_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-wm PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-WM_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-wm PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-UTIL-WM_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-WM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-UTIL-WM_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-WM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-UTIL-WM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-WM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-UTIL-WM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-WM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-UTIL-WM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-UTIL-WM_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE} CONAN_PKG::xcb-util")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-IMAGE}" "${CONAN_LIB_DIRS_XCB-UTIL-IMAGE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES}"
                                  "" xcb-util-image)
    set(_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE_DEBUG} CONAN_PKG::xcb-util")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEBUG}" "${CONAN_LIB_DIRS_XCB-UTIL-IMAGE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-util-image)
    set(_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE_RELEASE} CONAN_PKG::xcb-util")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-IMAGE_RELEASE}" "${CONAN_LIB_DIRS_XCB-UTIL-IMAGE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELEASE}"
                                  "release" xcb-util-image)
    set(_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE_RELWITHDEBINFO} CONAN_PKG::xcb-util")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-IMAGE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-UTIL-IMAGE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-util-image)
    set(_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-UTIL-IMAGE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL-IMAGE_MINSIZEREL} CONAN_PKG::xcb-util")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL-IMAGE_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-UTIL-IMAGE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-util-image)

    add_library(CONAN_PKG::xcb-util-image INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-util-image PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE} ${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_RELEASE} ${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-UTIL-IMAGE_DEBUG} ${_CONAN_PKG_LIBS_XCB-UTIL-IMAGE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL-IMAGE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL-IMAGE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-util-image PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-UTIL-IMAGE_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-image PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL-IMAGE_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util-image PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-UTIL-IMAGE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-UTIL-IMAGE_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-UTIL-IMAGE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-UTIL-IMAGE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-UTIL-IMAGE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-UTIL-IMAGE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXCURSOR} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR} CONAN_PKG::libxfixes CONAN_PKG::libxrender")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCURSOR}" "${CONAN_LIB_DIRS_LIBXCURSOR}"
                                  CONAN_PACKAGE_TARGETS_LIBXCURSOR "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES}"
                                  "" libxcursor)
    set(_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXCURSOR_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR_DEBUG} CONAN_PKG::libxfixes CONAN_PKG::libxrender")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCURSOR_DEBUG}" "${CONAN_LIB_DIRS_LIBXCURSOR_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXCURSOR_DEBUG "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_DEBUG}"
                                  "debug" libxcursor)
    set(_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXCURSOR_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR_RELEASE} CONAN_PKG::libxfixes CONAN_PKG::libxrender")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCURSOR_RELEASE}" "${CONAN_LIB_DIRS_LIBXCURSOR_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXCURSOR_RELEASE "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELEASE}"
                                  "release" libxcursor)
    set(_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXCURSOR_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR_RELWITHDEBINFO} CONAN_PKG::libxfixes CONAN_PKG::libxrender")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCURSOR_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXCURSOR_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXCURSOR_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxcursor)
    set(_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXCURSOR_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXCURSOR_MINSIZEREL} CONAN_PKG::libxfixes CONAN_PKG::libxrender")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCURSOR_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXCURSOR_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXCURSOR_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxcursor)

    add_library(CONAN_PKG::libxcursor INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxcursor PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXCURSOR} ${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXCURSOR_RELEASE} ${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXCURSOR_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXCURSOR_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXCURSOR_DEBUG} ${_CONAN_PKG_LIBS_LIBXCURSOR_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCURSOR_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCURSOR_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxcursor PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXCURSOR}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXCURSOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXCURSOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXCURSOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXCURSOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxcursor PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXCURSOR}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXCURSOR_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXCURSOR_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXCURSOR_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXCURSOR_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxcursor PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXCURSOR_LIST} ${CONAN_CXX_FLAGS_LIBXCURSOR_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXCURSOR_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXCURSOR_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXCURSOR_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXCURSOR_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXCURSOR_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXCURSOR_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXCURSOR_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXCURSOR_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XKBCOMMON} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON} CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON}" "${CONAN_LIB_DIRS_XKBCOMMON}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}"
                                  "" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XKBCOMMON_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_DEBUG} CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_DEBUG}" "${CONAN_LIB_DIRS_XKBCOMMON_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_DEBUG "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}"
                                  "debug" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XKBCOMMON_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_RELEASE} CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_RELEASE}" "${CONAN_LIB_DIRS_XKBCOMMON_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_RELEASE "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}"
                                  "release" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XKBCOMMON_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_RELWITHDEBINFO} CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XKBCOMMON_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XKBCOMMON_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_MINSIZEREL} CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_MINSIZEREL}" "${CONAN_LIB_DIRS_XKBCOMMON_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_MINSIZEREL "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xkbcommon)

    add_library(CONAN_PKG::xkbcommon INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XKBCOMMON} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_RELEASE} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_MINSIZEREL} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_DEBUG} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XKBCOMMON}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XKBCOMMON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XKBCOMMON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XKBCOMMON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XKBCOMMON_DEBUG}>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XKBCOMMON}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_DEBUG}>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XKBCOMMON_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XKBCOMMON_RELEASE_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XKBCOMMON_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XKBCOMMON_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XKBCOMMON_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD}" "${CONAN_LIB_DIRS_ZSTD}"
                                  CONAN_PACKAGE_TARGETS_ZSTD "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}"
                                  "" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZSTD_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZSTD_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_DEBUG}" "${CONAN_LIB_DIRS_ZSTD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}"
                                  "debug" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZSTD_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELEASE}" "${CONAN_LIB_DIRS_ZSTD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}"
                                  "release" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZSTD_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZSTD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZSTD_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZSTD_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_MINSIZEREL}" "${CONAN_LIB_DIRS_ZSTD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zstd)

    add_library(CONAN_PKG::zstd INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZSTD} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZSTD_RELEASE} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZSTD_DEBUG} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZSTD_LIST} ${CONAN_CXX_FLAGS_ZSTD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZSTD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZSTD_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL}" "${CONAN_LIB_DIRS_OPENGL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}"
                                  "" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENGL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENGL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_DEBUG}" "${CONAN_LIB_DIRS_OPENGL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}"
                                  "debug" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENGL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELEASE}" "${CONAN_LIB_DIRS_OPENGL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}"
                                  "release" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENGL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENGL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENGL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENGL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENGL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opengl)

    add_library(CONAN_PKG::opengl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENGL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENGL_RELEASE} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENGL_DEBUG} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENGL_LIST} ${CONAN_CXX_FLAGS_OPENGL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENGL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENGL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENGL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENGL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENGL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBALSA} ${CONAN_FRAMEWORKS_FOUND_LIBALSA} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBALSA}" "${CONAN_LIB_DIRS_LIBALSA}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES}"
                                  "" libalsa)
    set(_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBALSA_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBALSA_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBALSA_DEBUG}" "${CONAN_LIB_DIRS_LIBALSA_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_DEBUG "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_DEBUG}"
                                  "debug" libalsa)
    set(_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBALSA_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBALSA_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBALSA_RELEASE}" "${CONAN_LIB_DIRS_LIBALSA_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_RELEASE "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELEASE}"
                                  "release" libalsa)
    set(_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBALSA_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBALSA_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBALSA_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBALSA_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libalsa)
    set(_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBALSA_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBALSA_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBALSA_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBALSA_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBALSA_MINSIZEREL "${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libalsa)

    add_library(CONAN_PKG::libalsa INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBALSA} ${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBALSA_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBALSA_RELEASE} ${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBALSA_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBALSA_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBALSA_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBALSA_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBALSA_DEBUG} ${_CONAN_PKG_LIBS_LIBALSA_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBALSA_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBALSA_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBALSA}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBALSA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBALSA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBALSA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBALSA_DEBUG}>)
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBALSA}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBALSA_DEBUG}>)
    set_property(TARGET CONAN_PKG::libalsa PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBALSA_LIST} ${CONAN_CXX_FLAGS_LIBALSA_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBALSA_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBALSA_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBALSA_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBALSA_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBALSA_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBALSA_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBALSA_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBALSA_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL}" "${CONAN_LIB_DIRS_OPENSSL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}"
                                  "" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENSSL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_DEBUG}" "${CONAN_LIB_DIRS_OPENSSL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}"
                                  "debug" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENSSL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELEASE}" "${CONAN_LIB_DIRS_OPENSSL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}"
                                  "release" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENSSL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENSSL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENSSL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENSSL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openssl)

    add_library(CONAN_PKG::openssl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENSSL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENSSL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENSSL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENSSL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENSSL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENSSL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENSSL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLIB} ${CONAN_FRAMEWORKS_FOUND_GLIB} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB}" "${CONAN_LIB_DIRS_GLIB}"
                                  CONAN_PACKAGE_TARGETS_GLIB "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}"
                                  "" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLIB_DEBUG} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_DEBUG}" "${CONAN_LIB_DIRS_GLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLIB_DEBUG "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}"
                                  "debug" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLIB_RELEASE} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_RELEASE}" "${CONAN_LIB_DIRS_GLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLIB_RELEASE "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}"
                                  "release" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLIB_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glib)
    set(_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLIB_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_GLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLIB_MINSIZEREL "${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glib)

    add_library(CONAN_PKG::glib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLIB} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLIB_RELEASE} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLIB_DEBUG} ${_CONAN_PKG_LIBS_GLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::glib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLIB_LIST} ${CONAN_CXX_FLAGS_GLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE}" "${CONAN_LIB_DIRS_FREETYPE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}"
                                  "" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FREETYPE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_DEBUG} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_DEBUG}" "${CONAN_LIB_DIRS_FREETYPE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}"
                                  "debug" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FREETYPE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELEASE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELEASE}" "${CONAN_LIB_DIRS_FREETYPE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}"
                                  "release" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FREETYPE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELWITHDEBINFO} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FREETYPE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FREETYPE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_MINSIZEREL} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_MINSIZEREL}" "${CONAN_LIB_DIRS_FREETYPE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" freetype)

    add_library(CONAN_PKG::freetype INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FREETYPE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FREETYPE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FREETYPE_RELEASE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FREETYPE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FREETYPE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FREETYPE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FREETYPE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT}" "${CONAN_LIB_DIRS_EXPAT}"
                                  CONAN_PACKAGE_TARGETS_EXPAT "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}"
                                  "" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_EXPAT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_EXPAT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_DEBUG}" "${CONAN_LIB_DIRS_EXPAT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}"
                                  "debug" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_EXPAT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELEASE}" "${CONAN_LIB_DIRS_EXPAT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}"
                                  "release" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_EXPAT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_EXPAT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_EXPAT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_EXPAT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_MINSIZEREL}" "${CONAN_LIB_DIRS_EXPAT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" expat)

    add_library(CONAN_PKG::expat INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_EXPAT} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_EXPAT_RELEASE} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_EXPAT_DEBUG} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_EXPAT_LIST} ${CONAN_CXX_FLAGS_EXPAT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_EXPAT_RELEASE_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_EXPAT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_EXPAT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_EXPAT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_EXPAT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBUUID} ${CONAN_FRAMEWORKS_FOUND_LIBUUID} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID}" "${CONAN_LIB_DIRS_LIBUUID}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}"
                                  "" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBUUID_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_DEBUG}" "${CONAN_LIB_DIRS_LIBUUID_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_DEBUG "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}"
                                  "debug" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBUUID_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_RELEASE}" "${CONAN_LIB_DIRS_LIBUUID_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_RELEASE "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}"
                                  "release" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBUUID_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBUUID_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBUUID_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBUUID_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_MINSIZEREL "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libuuid)

    add_library(CONAN_PKG::libuuid INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBUUID} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBUUID_RELEASE} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBUUID_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBUUID_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBUUID_DEBUG} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBUUID}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBUUID_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBUUID_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBUUID_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBUUID_DEBUG}>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBUUID}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_DEBUG}>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBUUID_LIST} ${CONAN_CXX_FLAGS_LIBUUID_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBUUID_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBUUID_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBUUID_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBUUID_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBUUID_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV}" "${CONAN_LIB_DIRS_LIBICONV}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}"
                                  "" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBICONV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_DEBUG}" "${CONAN_LIB_DIRS_LIBICONV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}"
                                  "debug" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBICONV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELEASE}" "${CONAN_LIB_DIRS_LIBICONV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}"
                                  "release" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBICONV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBICONV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBICONV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBICONV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libiconv)

    add_library(CONAN_PKG::libiconv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBICONV} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBICONV_LIST} ${CONAN_CXX_FLAGS_LIBICONV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBICONV_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBICONV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBICONV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBICONV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBICONV_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-UTIL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL}" "${CONAN_LIB_DIRS_XCB-UTIL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES}"
                                  "" xcb-util)
    set(_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-UTIL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL_DEBUG} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL_DEBUG}" "${CONAN_LIB_DIRS_XCB-UTIL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL_DEBUG "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-util)
    set(_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-UTIL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL_RELEASE} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL_RELEASE}" "${CONAN_LIB_DIRS_XCB-UTIL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL_RELEASE "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELEASE}"
                                  "release" xcb-util)
    set(_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-UTIL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL_RELWITHDEBINFO} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-UTIL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-util)
    set(_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-UTIL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-UTIL_MINSIZEREL} CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-UTIL_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-UTIL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-UTIL_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-util)

    add_library(CONAN_PKG::xcb-util INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-util PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-UTIL} ${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-UTIL_RELEASE} ${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-UTIL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-UTIL_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-UTIL_DEBUG} ${_CONAN_PKG_LIBS_XCB-UTIL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-UTIL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-UTIL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-util PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-UTIL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-UTIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-UTIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-UTIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-UTIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-UTIL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-UTIL_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-util PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-UTIL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-UTIL_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-UTIL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-UTIL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-UTIL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-UTIL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-UTIL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXFIXES} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXFIXES}" "${CONAN_LIB_DIRS_LIBXFIXES}"
                                  CONAN_PACKAGE_TARGETS_LIBXFIXES "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES}"
                                  "" libxfixes)
    set(_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXFIXES_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES_DEBUG} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXFIXES_DEBUG}" "${CONAN_LIB_DIRS_LIBXFIXES_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXFIXES_DEBUG "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_DEBUG}"
                                  "debug" libxfixes)
    set(_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXFIXES_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES_RELEASE} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXFIXES_RELEASE}" "${CONAN_LIB_DIRS_LIBXFIXES_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXFIXES_RELEASE "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELEASE}"
                                  "release" libxfixes)
    set(_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXFIXES_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES_RELWITHDEBINFO} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXFIXES_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXFIXES_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXFIXES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxfixes)
    set(_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXFIXES_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXFIXES_MINSIZEREL} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXFIXES_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXFIXES_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXFIXES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxfixes)

    add_library(CONAN_PKG::libxfixes INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxfixes PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXFIXES} ${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXFIXES_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXFIXES_RELEASE} ${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXFIXES_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXFIXES_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXFIXES_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXFIXES_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXFIXES_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXFIXES_DEBUG} ${_CONAN_PKG_LIBS_LIBXFIXES_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXFIXES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXFIXES_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxfixes PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXFIXES}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXFIXES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXFIXES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXFIXES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXFIXES_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxfixes PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXFIXES}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXFIXES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXFIXES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXFIXES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXFIXES_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxfixes PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXFIXES_LIST} ${CONAN_CXX_FLAGS_LIBXFIXES_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXFIXES_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXFIXES_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXFIXES_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXFIXES_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXFIXES_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXFIXES_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXFIXES_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXFIXES_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXRENDER} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXRENDER}" "${CONAN_LIB_DIRS_LIBXRENDER}"
                                  CONAN_PACKAGE_TARGETS_LIBXRENDER "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES}"
                                  "" libxrender)
    set(_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXRENDER_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER_DEBUG} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXRENDER_DEBUG}" "${CONAN_LIB_DIRS_LIBXRENDER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXRENDER_DEBUG "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_DEBUG}"
                                  "debug" libxrender)
    set(_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXRENDER_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER_RELEASE} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXRENDER_RELEASE}" "${CONAN_LIB_DIRS_LIBXRENDER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXRENDER_RELEASE "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELEASE}"
                                  "release" libxrender)
    set(_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXRENDER_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER_RELWITHDEBINFO} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXRENDER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXRENDER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXRENDER_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxrender)
    set(_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXRENDER_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXRENDER_MINSIZEREL} CONAN_PKG::libx11")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXRENDER_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXRENDER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXRENDER_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxrender)

    add_library(CONAN_PKG::libxrender INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxrender PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXRENDER} ${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXRENDER_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXRENDER_RELEASE} ${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXRENDER_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXRENDER_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXRENDER_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXRENDER_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXRENDER_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXRENDER_DEBUG} ${_CONAN_PKG_LIBS_LIBXRENDER_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXRENDER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXRENDER_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxrender PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXRENDER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXRENDER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXRENDER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXRENDER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXRENDER_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxrender PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXRENDER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXRENDER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXRENDER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXRENDER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXRENDER_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxrender PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXRENDER_LIST} ${CONAN_CXX_FLAGS_LIBXRENDER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXRENDER_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXRENDER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXRENDER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXRENDER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXRENDER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXRENDER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXRENDER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXRENDER_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG}" "${CONAN_LIB_DIRS_XORG}"
                                  CONAN_PACKAGE_TARGETS_XORG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}"
                                  "" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XORG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XORG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_DEBUG}" "${CONAN_LIB_DIRS_XORG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XORG_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}"
                                  "debug" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XORG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XORG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELEASE}" "${CONAN_LIB_DIRS_XORG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}"
                                  "release" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XORG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XORG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XORG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XORG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XORG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_MINSIZEREL}" "${CONAN_LIB_DIRS_XORG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xorg)

    add_library(CONAN_PKG::xorg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XORG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XORG_RELEASE} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XORG_DEBUG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XORG_LIST} ${CONAN_CXX_FLAGS_XORG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XORG_RELEASE_LIST} ${CONAN_CXX_FLAGS_XORG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XORG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XORG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XORG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XORG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBFFI} ${CONAN_FRAMEWORKS_FOUND_LIBFFI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI}" "${CONAN_LIB_DIRS_LIBFFI}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}"
                                  "" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBFFI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_DEBUG}" "${CONAN_LIB_DIRS_LIBFFI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_DEBUG "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}"
                                  "debug" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBFFI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_RELEASE}" "${CONAN_LIB_DIRS_LIBFFI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_RELEASE "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}"
                                  "release" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBFFI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBFFI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libffi)
    set(_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBFFI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBFFI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBFFI_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBFFI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBFFI_MINSIZEREL "${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libffi)

    add_library(CONAN_PKG::libffi INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBFFI} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBFFI_RELEASE} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBFFI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBFFI_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBFFI_DEBUG} ${_CONAN_PKG_LIBS_LIBFFI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBFFI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBFFI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBFFI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBFFI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBFFI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBFFI_DEBUG}>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBFFI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBFFI_DEBUG}>)
    set_property(TARGET CONAN_PKG::libffi PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBFFI_LIST} ${CONAN_CXX_FLAGS_LIBFFI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBFFI_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBFFI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBFFI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBFFI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBFFI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBFFI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBFFI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBFFI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE} ${CONAN_FRAMEWORKS_FOUND_PCRE} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE}" "${CONAN_LIB_DIRS_PCRE}"
                                  CONAN_PACKAGE_TARGETS_PCRE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}"
                                  "" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE_DEBUG} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_DEBUG}" "${CONAN_LIB_DIRS_PCRE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE_DEBUG "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}"
                                  "debug" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE_RELEASE} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_RELEASE}" "${CONAN_LIB_DIRS_PCRE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE_RELEASE "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}"
                                  "release" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE_RELWITHDEBINFO} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre)
    set(_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE_MINSIZEREL} CONAN_PKG::bzip2 CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre)

    add_library(CONAN_PKG::pcre INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE_RELEASE} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE_DEBUG} ${_CONAN_PKG_LIBS_PCRE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE_LIST} ${CONAN_CXX_FLAGS_PCRE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBELF} ${CONAN_FRAMEWORKS_FOUND_LIBELF} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF}" "${CONAN_LIB_DIRS_LIBELF}"
                                  CONAN_PACKAGE_TARGETS_LIBELF "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}"
                                  "" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBELF_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBELF_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_DEBUG}" "${CONAN_LIB_DIRS_LIBELF_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_DEBUG "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}"
                                  "debug" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBELF_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBELF_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_RELEASE}" "${CONAN_LIB_DIRS_LIBELF_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_RELEASE "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}"
                                  "release" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBELF_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBELF_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBELF_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libelf)
    set(_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBELF_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBELF_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBELF_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBELF_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBELF_MINSIZEREL "${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libelf)

    add_library(CONAN_PKG::libelf INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBELF} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBELF_RELEASE} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBELF_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBELF_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBELF_DEBUG} ${_CONAN_PKG_LIBS_LIBELF_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBELF_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBELF_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBELF}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBELF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBELF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBELF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBELF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBELF}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBELF_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBELF_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBELF_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBELF_DEBUG}>)
    set_property(TARGET CONAN_PKG::libelf PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBELF_LIST} ${CONAN_CXX_FLAGS_LIBELF_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBELF_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBELF_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBELF_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBELF_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBELF_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBELF_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBELF_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBELF_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBMOUNT} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMOUNT}" "${CONAN_LIB_DIRS_LIBMOUNT}"
                                  CONAN_PACKAGE_TARGETS_LIBMOUNT "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES}"
                                  "" libmount)
    set(_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBMOUNT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMOUNT_DEBUG}" "${CONAN_LIB_DIRS_LIBMOUNT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBMOUNT_DEBUG "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_DEBUG}"
                                  "debug" libmount)
    set(_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBMOUNT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMOUNT_RELEASE}" "${CONAN_LIB_DIRS_LIBMOUNT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBMOUNT_RELEASE "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELEASE}"
                                  "release" libmount)
    set(_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBMOUNT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMOUNT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBMOUNT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBMOUNT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libmount)
    set(_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBMOUNT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBMOUNT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMOUNT_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBMOUNT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBMOUNT_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libmount)

    add_library(CONAN_PKG::libmount INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libmount PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBMOUNT} ${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMOUNT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBMOUNT_RELEASE} ${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMOUNT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBMOUNT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMOUNT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBMOUNT_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMOUNT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBMOUNT_DEBUG} ${_CONAN_PKG_LIBS_LIBMOUNT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMOUNT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMOUNT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libmount PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBMOUNT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBMOUNT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBMOUNT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBMOUNT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBMOUNT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmount PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBMOUNT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBMOUNT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBMOUNT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBMOUNT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBMOUNT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmount PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBMOUNT_LIST} ${CONAN_CXX_FLAGS_LIBMOUNT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBMOUNT_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBMOUNT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBMOUNT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBMOUNT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBMOUNT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBMOUNT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBMOUNT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBMOUNT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBSELINUX} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX} CONAN_PKG::pcre2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBSELINUX}" "${CONAN_LIB_DIRS_LIBSELINUX}"
                                  CONAN_PACKAGE_TARGETS_LIBSELINUX "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES}"
                                  "" libselinux)
    set(_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBSELINUX_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX_DEBUG} CONAN_PKG::pcre2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBSELINUX_DEBUG}" "${CONAN_LIB_DIRS_LIBSELINUX_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBSELINUX_DEBUG "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_DEBUG}"
                                  "debug" libselinux)
    set(_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBSELINUX_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX_RELEASE} CONAN_PKG::pcre2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBSELINUX_RELEASE}" "${CONAN_LIB_DIRS_LIBSELINUX_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBSELINUX_RELEASE "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELEASE}"
                                  "release" libselinux)
    set(_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBSELINUX_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX_RELWITHDEBINFO} CONAN_PKG::pcre2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBSELINUX_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBSELINUX_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBSELINUX_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libselinux)
    set(_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBSELINUX_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBSELINUX_MINSIZEREL} CONAN_PKG::pcre2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBSELINUX_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBSELINUX_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBSELINUX_MINSIZEREL "${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libselinux)

    add_library(CONAN_PKG::libselinux INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libselinux PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBSELINUX} ${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBSELINUX_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBSELINUX_RELEASE} ${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBSELINUX_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBSELINUX_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBSELINUX_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBSELINUX_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBSELINUX_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBSELINUX_DEBUG} ${_CONAN_PKG_LIBS_LIBSELINUX_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBSELINUX_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBSELINUX_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libselinux PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBSELINUX}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBSELINUX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBSELINUX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBSELINUX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBSELINUX_DEBUG}>)
    set_property(TARGET CONAN_PKG::libselinux PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBSELINUX}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBSELINUX_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBSELINUX_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBSELINUX_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBSELINUX_DEBUG}>)
    set_property(TARGET CONAN_PKG::libselinux PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBSELINUX_LIST} ${CONAN_CXX_FLAGS_LIBSELINUX_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBSELINUX_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBSELINUX_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBSELINUX_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBSELINUX_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBSELINUX_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBSELINUX_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBSELINUX_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBSELINUX_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG}" "${CONAN_LIB_DIRS_LIBPNG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}"
                                  "" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPNG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_DEBUG}" "${CONAN_LIB_DIRS_LIBPNG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}"
                                  "debug" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPNG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELEASE}" "${CONAN_LIB_DIRS_LIBPNG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}"
                                  "release" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPNG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPNG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPNG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPNG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpng)

    add_library(CONAN_PKG::libpng INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPNG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPNG_LIST} ${CONAN_CXX_FLAGS_LIBPNG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPNG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPNG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBX11} ${CONAN_FRAMEWORKS_FOUND_LIBX11} CONAN_PKG::xorgproto CONAN_PKG::xtrans CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBX11_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBX11}" "${CONAN_LIB_DIRS_LIBX11}"
                                  CONAN_PACKAGE_TARGETS_LIBX11 "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES}"
                                  "" libx11)
    set(_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBX11_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBX11_DEBUG} CONAN_PKG::xorgproto CONAN_PKG::xtrans CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBX11_DEBUG}" "${CONAN_LIB_DIRS_LIBX11_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBX11_DEBUG "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_DEBUG}"
                                  "debug" libx11)
    set(_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBX11_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBX11_RELEASE} CONAN_PKG::xorgproto CONAN_PKG::xtrans CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBX11_RELEASE}" "${CONAN_LIB_DIRS_LIBX11_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBX11_RELEASE "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELEASE}"
                                  "release" libx11)
    set(_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBX11_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBX11_RELWITHDEBINFO} CONAN_PKG::xorgproto CONAN_PKG::xtrans CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBX11_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBX11_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBX11_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libx11)
    set(_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBX11_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBX11_MINSIZEREL} CONAN_PKG::xorgproto CONAN_PKG::xtrans CONAN_PKG::libxcb")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBX11_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBX11_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBX11_MINSIZEREL "${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libx11)

    add_library(CONAN_PKG::libx11 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libx11 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBX11} ${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBX11_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBX11_RELEASE} ${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBX11_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBX11_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBX11_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBX11_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBX11_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBX11_DEBUG} ${_CONAN_PKG_LIBS_LIBX11_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBX11_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBX11_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libx11 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBX11}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBX11_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBX11_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBX11_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBX11_DEBUG}>)
    set_property(TARGET CONAN_PKG::libx11 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBX11}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBX11_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBX11_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBX11_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBX11_DEBUG}>)
    set_property(TARGET CONAN_PKG::libx11 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBX11_LIST} ${CONAN_CXX_FLAGS_LIBX11_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBX11_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBX11_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBX11_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBX11_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBX11_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBX11_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBX11_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBX11_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2}" "${CONAN_LIB_DIRS_PCRE2}"
                                  CONAN_PACKAGE_TARGETS_PCRE2 "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}"
                                  "" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE2_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_DEBUG}" "${CONAN_LIB_DIRS_PCRE2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}"
                                  "debug" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELEASE}" "${CONAN_LIB_DIRS_PCRE2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}"
                                  "release" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE2_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre2)

    add_library(CONAN_PKG::pcre2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE2} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE2_RELEASE} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE2_DEBUG} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE2_LIST} ${CONAN_CXX_FLAGS_PCRE2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE2_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXCB} ${CONAN_FRAMEWORKS_FOUND_LIBXCB} CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCB}" "${CONAN_LIB_DIRS_LIBXCB}"
                                  CONAN_PACKAGE_TARGETS_LIBXCB "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES}"
                                  "" libxcb)
    set(_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXCB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXCB_DEBUG} CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCB_DEBUG}" "${CONAN_LIB_DIRS_LIBXCB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXCB_DEBUG "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_DEBUG}"
                                  "debug" libxcb)
    set(_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXCB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXCB_RELEASE} CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCB_RELEASE}" "${CONAN_LIB_DIRS_LIBXCB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXCB_RELEASE "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELEASE}"
                                  "release" libxcb)
    set(_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXCB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXCB_RELWITHDEBINFO} CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXCB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXCB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxcb)
    set(_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXCB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXCB_MINSIZEREL} CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXCB_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXCB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXCB_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxcb)

    add_library(CONAN_PKG::libxcb INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxcb PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXCB} ${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXCB_RELEASE} ${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXCB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXCB_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXCB_DEBUG} ${_CONAN_PKG_LIBS_LIBXCB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXCB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXCB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxcb PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXCB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXCB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXCB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXCB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXCB_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxcb PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXCB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXCB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXCB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXCB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXCB_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxcb PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXCB_LIST} ${CONAN_CXX_FLAGS_LIBXCB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXCB_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXCB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXCB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXCB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXCB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXCB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXCB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXCB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XTRANS} ${CONAN_FRAMEWORKS_FOUND_XTRANS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XTRANS_DEPENDENCIES "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XTRANS}" "${CONAN_LIB_DIRS_XTRANS}"
                                  CONAN_PACKAGE_TARGETS_XTRANS "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES}"
                                  "" xtrans)
    set(_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XTRANS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XTRANS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XTRANS_DEBUG}" "${CONAN_LIB_DIRS_XTRANS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XTRANS_DEBUG "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_DEBUG}"
                                  "debug" xtrans)
    set(_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XTRANS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XTRANS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XTRANS_RELEASE}" "${CONAN_LIB_DIRS_XTRANS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XTRANS_RELEASE "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELEASE}"
                                  "release" xtrans)
    set(_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XTRANS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XTRANS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XTRANS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XTRANS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XTRANS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xtrans)
    set(_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XTRANS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XTRANS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XTRANS_MINSIZEREL}" "${CONAN_LIB_DIRS_XTRANS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XTRANS_MINSIZEREL "${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xtrans)

    add_library(CONAN_PKG::xtrans INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xtrans PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XTRANS} ${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XTRANS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XTRANS_RELEASE} ${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XTRANS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XTRANS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XTRANS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XTRANS_MINSIZEREL} ${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XTRANS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XTRANS_DEBUG} ${_CONAN_PKG_LIBS_XTRANS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XTRANS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XTRANS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xtrans PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XTRANS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XTRANS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XTRANS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XTRANS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XTRANS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xtrans PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XTRANS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XTRANS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XTRANS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XTRANS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XTRANS_DEBUG}>)
    set_property(TARGET CONAN_PKG::xtrans PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XTRANS_LIST} ${CONAN_CXX_FLAGS_XTRANS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XTRANS_RELEASE_LIST} ${CONAN_CXX_FLAGS_XTRANS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XTRANS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XTRANS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XTRANS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XTRANS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XTRANS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XTRANS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XCB-PROTO} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-PROTO}" "${CONAN_LIB_DIRS_XCB-PROTO}"
                                  CONAN_PACKAGE_TARGETS_XCB-PROTO "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES}"
                                  "" xcb-proto)
    set(_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XCB-PROTO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-PROTO_DEBUG}" "${CONAN_LIB_DIRS_XCB-PROTO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XCB-PROTO_DEBUG "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_DEBUG}"
                                  "debug" xcb-proto)
    set(_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XCB-PROTO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-PROTO_RELEASE}" "${CONAN_LIB_DIRS_XCB-PROTO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XCB-PROTO_RELEASE "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELEASE}"
                                  "release" xcb-proto)
    set(_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XCB-PROTO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-PROTO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XCB-PROTO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XCB-PROTO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xcb-proto)
    set(_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XCB-PROTO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XCB-PROTO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XCB-PROTO_MINSIZEREL}" "${CONAN_LIB_DIRS_XCB-PROTO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XCB-PROTO_MINSIZEREL "${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xcb-proto)

    add_library(CONAN_PKG::xcb-proto INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xcb-proto PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XCB-PROTO} ${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-PROTO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XCB-PROTO_RELEASE} ${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-PROTO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XCB-PROTO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-PROTO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XCB-PROTO_MINSIZEREL} ${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-PROTO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XCB-PROTO_DEBUG} ${_CONAN_PKG_LIBS_XCB-PROTO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XCB-PROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XCB-PROTO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xcb-proto PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XCB-PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XCB-PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XCB-PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XCB-PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XCB-PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-proto PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XCB-PROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XCB-PROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XCB-PROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XCB-PROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XCB-PROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xcb-proto PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XCB-PROTO_LIST} ${CONAN_CXX_FLAGS_XCB-PROTO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XCB-PROTO_RELEASE_LIST} ${CONAN_CXX_FLAGS_XCB-PROTO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XCB-PROTO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XCB-PROTO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XCB-PROTO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XCB-PROTO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XCB-PROTO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XCB-PROTO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_UTIL-MACROS} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTIL-MACROS}" "${CONAN_LIB_DIRS_UTIL-MACROS}"
                                  CONAN_PACKAGE_TARGETS_UTIL-MACROS "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES}"
                                  "" util-macros)
    set(_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_UTIL-MACROS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTIL-MACROS_DEBUG}" "${CONAN_LIB_DIRS_UTIL-MACROS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_UTIL-MACROS_DEBUG "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_DEBUG}"
                                  "debug" util-macros)
    set(_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_UTIL-MACROS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTIL-MACROS_RELEASE}" "${CONAN_LIB_DIRS_UTIL-MACROS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_UTIL-MACROS_RELEASE "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELEASE}"
                                  "release" util-macros)
    set(_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_UTIL-MACROS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTIL-MACROS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_UTIL-MACROS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_UTIL-MACROS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" util-macros)
    set(_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_UTIL-MACROS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_UTIL-MACROS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTIL-MACROS_MINSIZEREL}" "${CONAN_LIB_DIRS_UTIL-MACROS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_UTIL-MACROS_MINSIZEREL "${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" util-macros)

    add_library(CONAN_PKG::util-macros INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::util-macros PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_UTIL-MACROS} ${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_UTIL-MACROS_RELEASE} ${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_UTIL-MACROS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_UTIL-MACROS_MINSIZEREL} ${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_UTIL-MACROS_DEBUG} ${_CONAN_PKG_LIBS_UTIL-MACROS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTIL-MACROS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTIL-MACROS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::util-macros PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_UTIL-MACROS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_UTIL-MACROS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_UTIL-MACROS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_UTIL-MACROS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_UTIL-MACROS_DEBUG}>)
    set_property(TARGET CONAN_PKG::util-macros PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_UTIL-MACROS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_UTIL-MACROS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_UTIL-MACROS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_UTIL-MACROS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_UTIL-MACROS_DEBUG}>)
    set_property(TARGET CONAN_PKG::util-macros PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_UTIL-MACROS_LIST} ${CONAN_CXX_FLAGS_UTIL-MACROS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_UTIL-MACROS_RELEASE_LIST} ${CONAN_CXX_FLAGS_UTIL-MACROS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_UTIL-MACROS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_UTIL-MACROS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_UTIL-MACROS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_UTIL-MACROS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_UTIL-MACROS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_UTIL-MACROS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXAU} ${CONAN_FRAMEWORKS_FOUND_LIBXAU} CONAN_PKG::xorgproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXAU}" "${CONAN_LIB_DIRS_LIBXAU}"
                                  CONAN_PACKAGE_TARGETS_LIBXAU "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES}"
                                  "" libxau)
    set(_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXAU_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXAU_DEBUG} CONAN_PKG::xorgproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXAU_DEBUG}" "${CONAN_LIB_DIRS_LIBXAU_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXAU_DEBUG "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_DEBUG}"
                                  "debug" libxau)
    set(_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXAU_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXAU_RELEASE} CONAN_PKG::xorgproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXAU_RELEASE}" "${CONAN_LIB_DIRS_LIBXAU_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXAU_RELEASE "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELEASE}"
                                  "release" libxau)
    set(_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXAU_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXAU_RELWITHDEBINFO} CONAN_PKG::xorgproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXAU_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXAU_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXAU_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxau)
    set(_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXAU_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXAU_MINSIZEREL} CONAN_PKG::xorgproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXAU_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXAU_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXAU_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxau)

    add_library(CONAN_PKG::libxau INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxau PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXAU} ${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXAU_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXAU_RELEASE} ${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXAU_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXAU_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXAU_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXAU_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXAU_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXAU_DEBUG} ${_CONAN_PKG_LIBS_LIBXAU_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXAU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXAU_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxau PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXAU}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXAU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXAU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXAU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXAU_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxau PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXAU}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXAU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXAU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXAU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXAU_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxau PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXAU_LIST} ${CONAN_CXX_FLAGS_LIBXAU_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXAU_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXAU_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXAU_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXAU_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXAU_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXAU_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXAU_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXAU_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPTHREAD-STUBS}" "${CONAN_LIB_DIRS_LIBPTHREAD-STUBS}"
                                  CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES}"
                                  "" libpthread-stubs)
    set(_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEBUG}" "${CONAN_LIB_DIRS_LIBPTHREAD-STUBS_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_DEBUG "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_DEBUG}"
                                  "debug" libpthread-stubs)
    set(_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPTHREAD-STUBS_RELEASE}" "${CONAN_LIB_DIRS_LIBPTHREAD-STUBS_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_RELEASE "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELEASE}"
                                  "release" libpthread-stubs)
    set(_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPTHREAD-STUBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPTHREAD-STUBS_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpthread-stubs)
    set(_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPTHREAD-STUBS_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPTHREAD-STUBS_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPTHREAD-STUBS_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPTHREAD-STUBS_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpthread-stubs)

    add_library(CONAN_PKG::libpthread-stubs INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpthread-stubs PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS} ${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_RELEASE} ${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPTHREAD-STUBS_DEBUG} ${_CONAN_PKG_LIBS_LIBPTHREAD-STUBS_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPTHREAD-STUBS_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPTHREAD-STUBS_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpthread-stubs PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPTHREAD-STUBS_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpthread-stubs PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPTHREAD-STUBS_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpthread-stubs PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPTHREAD-STUBS_LIST} ${CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPTHREAD-STUBS_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPTHREAD-STUBS_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPTHREAD-STUBS_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPTHREAD-STUBS_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPTHREAD-STUBS_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXDMCP} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP} CONAN_PKG::xproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXDMCP}" "${CONAN_LIB_DIRS_LIBXDMCP}"
                                  CONAN_PACKAGE_TARGETS_LIBXDMCP "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES}"
                                  "" libxdmcp)
    set(_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXDMCP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP_DEBUG} CONAN_PKG::xproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXDMCP_DEBUG}" "${CONAN_LIB_DIRS_LIBXDMCP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXDMCP_DEBUG "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_DEBUG}"
                                  "debug" libxdmcp)
    set(_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXDMCP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP_RELEASE} CONAN_PKG::xproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXDMCP_RELEASE}" "${CONAN_LIB_DIRS_LIBXDMCP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXDMCP_RELEASE "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELEASE}"
                                  "release" libxdmcp)
    set(_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXDMCP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP_RELWITHDEBINFO} CONAN_PKG::xproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXDMCP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXDMCP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXDMCP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxdmcp)
    set(_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXDMCP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXDMCP_MINSIZEREL} CONAN_PKG::xproto")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXDMCP_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXDMCP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXDMCP_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxdmcp)

    add_library(CONAN_PKG::libxdmcp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxdmcp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXDMCP} ${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXDMCP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXDMCP_RELEASE} ${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXDMCP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXDMCP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXDMCP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXDMCP_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXDMCP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXDMCP_DEBUG} ${_CONAN_PKG_LIBS_LIBXDMCP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXDMCP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXDMCP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxdmcp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXDMCP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXDMCP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXDMCP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXDMCP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXDMCP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxdmcp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXDMCP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXDMCP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXDMCP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXDMCP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXDMCP_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxdmcp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXDMCP_LIST} ${CONAN_CXX_FLAGS_LIBXDMCP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXDMCP_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXDMCP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXDMCP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXDMCP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXDMCP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXDMCP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXDMCP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXDMCP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XORGPROTO} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORGPROTO}" "${CONAN_LIB_DIRS_XORGPROTO}"
                                  CONAN_PACKAGE_TARGETS_XORGPROTO "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES}"
                                  "" xorgproto)
    set(_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XORGPROTO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORGPROTO_DEBUG}" "${CONAN_LIB_DIRS_XORGPROTO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XORGPROTO_DEBUG "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_DEBUG}"
                                  "debug" xorgproto)
    set(_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XORGPROTO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORGPROTO_RELEASE}" "${CONAN_LIB_DIRS_XORGPROTO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XORGPROTO_RELEASE "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELEASE}"
                                  "release" xorgproto)
    set(_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XORGPROTO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORGPROTO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XORGPROTO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XORGPROTO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xorgproto)
    set(_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XORGPROTO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XORGPROTO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORGPROTO_MINSIZEREL}" "${CONAN_LIB_DIRS_XORGPROTO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XORGPROTO_MINSIZEREL "${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xorgproto)

    add_library(CONAN_PKG::xorgproto INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xorgproto PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XORGPROTO} ${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORGPROTO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XORGPROTO_RELEASE} ${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORGPROTO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XORGPROTO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORGPROTO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XORGPROTO_MINSIZEREL} ${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORGPROTO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XORGPROTO_DEBUG} ${_CONAN_PKG_LIBS_XORGPROTO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORGPROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORGPROTO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xorgproto PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XORGPROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XORGPROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XORGPROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XORGPROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XORGPROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorgproto PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XORGPROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XORGPROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XORGPROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XORGPROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XORGPROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorgproto PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XORGPROTO_LIST} ${CONAN_CXX_FLAGS_XORGPROTO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XORGPROTO_RELEASE_LIST} ${CONAN_CXX_FLAGS_XORGPROTO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XORGPROTO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XORGPROTO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XORGPROTO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XORGPROTO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XORGPROTO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XORGPROTO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XPROTO} ${CONAN_FRAMEWORKS_FOUND_XPROTO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XPROTO_DEPENDENCIES "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XPROTO}" "${CONAN_LIB_DIRS_XPROTO}"
                                  CONAN_PACKAGE_TARGETS_XPROTO "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES}"
                                  "" xproto)
    set(_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XPROTO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XPROTO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XPROTO_DEBUG}" "${CONAN_LIB_DIRS_XPROTO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XPROTO_DEBUG "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_DEBUG}"
                                  "debug" xproto)
    set(_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XPROTO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XPROTO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XPROTO_RELEASE}" "${CONAN_LIB_DIRS_XPROTO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XPROTO_RELEASE "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELEASE}"
                                  "release" xproto)
    set(_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XPROTO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XPROTO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XPROTO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XPROTO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XPROTO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xproto)
    set(_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XPROTO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XPROTO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XPROTO_MINSIZEREL}" "${CONAN_LIB_DIRS_XPROTO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XPROTO_MINSIZEREL "${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xproto)

    add_library(CONAN_PKG::xproto INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xproto PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XPROTO} ${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XPROTO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XPROTO_RELEASE} ${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XPROTO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XPROTO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XPROTO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XPROTO_MINSIZEREL} ${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XPROTO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XPROTO_DEBUG} ${_CONAN_PKG_LIBS_XPROTO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XPROTO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XPROTO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xproto PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XPROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XPROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XPROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XPROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XPROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xproto PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XPROTO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XPROTO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XPROTO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XPROTO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XPROTO_DEBUG}>)
    set_property(TARGET CONAN_PKG::xproto PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XPROTO_LIST} ${CONAN_CXX_FLAGS_XPROTO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XPROTO_RELEASE_LIST} ${CONAN_CXX_FLAGS_XPROTO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XPROTO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XPROTO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XPROTO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XPROTO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XPROTO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XPROTO_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::qt CONAN_PKG::portaudio CONAN_PKG::opus CONAN_PKG::double-conversion CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::harfbuzz CONAN_PKG::libjpeg CONAN_PKG::sqlite3 CONAN_PKG::libmysqlclient CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xcb-util-keysyms CONAN_PKG::xcb-util-renderutil CONAN_PKG::xcb-util-wm CONAN_PKG::xcb-util-image CONAN_PKG::libxcursor CONAN_PKG::xkbcommon CONAN_PKG::zstd CONAN_PKG::opengl CONAN_PKG::libalsa CONAN_PKG::openssl CONAN_PKG::glib CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid CONAN_PKG::libiconv CONAN_PKG::xcb-util CONAN_PKG::libxfixes CONAN_PKG::libxrender CONAN_PKG::xorg CONAN_PKG::libffi CONAN_PKG::pcre CONAN_PKG::libelf CONAN_PKG::libmount CONAN_PKG::libselinux CONAN_PKG::libpng CONAN_PKG::libx11 CONAN_PKG::pcre2 CONAN_PKG::libxcb CONAN_PKG::xtrans CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::xcb-proto CONAN_PKG::util-macros CONAN_PKG::libxau CONAN_PKG::libpthread-stubs CONAN_PKG::libxdmcp CONAN_PKG::xorgproto CONAN_PKG::xproto)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_FREETYPE_LIBTOOL_VERSION "23.0.17")