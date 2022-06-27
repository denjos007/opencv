##
# Google Coral Toolchain for OpenCV 
#
# Place the file within the opencv source at platform/linux/
# Use this as the toolchain file for cmake 
#
# The google coral sys root must be located at the folder: /home/joseph/SoftwareTools/cross-compile/google-coral/sysroot
# If another folder is required, please edit variable GOOGLE_CORAL_SYSROOT_DIR to the correct one
##

# Target Architecture
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_SYSTEM_NAME Linux)
set(GNU_MACHINE "aarch64-linux-gnu" CACHE STRING "GNU compiler triple")
set(GCC_COMPILER_VERSION "" CACHE STRING "GCC Compiler version")

# Setup toolchain
set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
set(CMAKE_LINKER aarch64-linux-gnu-ld)
set(CMAKE_AR aarch64-linux-gnu-ar)

# Change this to the directory containing the sysroot
set(GOOGLE_CORAL_SYSROOT_DIR /home/joseph/SoftwareTools/cross-compile/google-coral/sysroot)

# Setup sysroot
set(CMAKE_SYSROOT ${GOOGLE_CORAL_SYSROOT_DIR})
set(CMAKE_FIND_ROOT_PATH ${GOOGLE_CORAL_SYSROOT_DIR})

# Setup package config
set(ENV{PKG_CONFIG_DIR} "")
set(ENV{PKG_CONFIG_LIBDIR} "${GOOGLE_CORAL_SYSROOT_DIR}/usr/lib/aarch64-linux-gnu/pkgconfig:${GOOGLE_CORAL_SYSROOT_DIR}/usr/lib/pkgconfig:${GOOGLE_CORAL_SYSROOT_DIR}/usr/share/pkgconfig")
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${GOOGLE_CORAL_SYSROOT_DIR})

include("${CMAKE_CURRENT_LIST_DIR}/arm.toolchain.cmake")
