# - Try to find the PolarSSL encryption library
# Once done this will define
#
#  PolarSSL_ROOT_DIR - Set this variable to the root installation of OpenSSL
#
# Read-Only variables:
#  PolarSSL_FOUND - system has the OpenSSL library
#  PolarSSL_INCLUDE_DIR - the OpenSSL include directory
#  PolarSSL_LIBRARIES - The libraries needed to use PolarSSL

#=============================================================================
# Copyright 2014 Richard Ulrich <richi@paraeasy.ch>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================


set(_PolarSSL_ROOT_HINTS
    ${PolarSSL_ROOT_DIR}
    ENV PolarSSL_ROOT_DIR
)

find_path(PolarSSL_INCLUDE_DIR
  NAMES
    polarssl/ssl.h
  HINTS
    ${_PolarSSL_INCLUDEDIR}
  ${_PolarSSL_ROOT_HINTS_AND_PATHS}
  PATH_SUFFIXES
    include
)

find_library(PolarSSL_SSL_LIBRARY
    NAMES
      polarssl
    PATH_SUFFIXES
      lib
)
mark_as_advanced(PolarSSL_SSL_LIBRARY)


set(PolarSSL_LIBRARIES ${PolarSSL_SSL_LIBRARY})




include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(PolarSSL
    REQUIRED_VARS
      PolarSSL_LIBRARIES
      PolarSSL_INCLUDE_DIR
    FAIL_MESSAGE
      "Could NOT find PolarSSL, try to set the path to PolarSSL root folder in the system variable PolarSSL_ROOT_DIR"
)


mark_as_advanced(PolarSSL_INCLUDE_DIR PolarSSL_LIBRARIES)
