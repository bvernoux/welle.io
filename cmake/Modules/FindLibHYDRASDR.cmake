if(NOT LIBHYDRASDR_FOUND)

  include(FindPkgConfig)
  pkg_check_modules (LIBHYDRASDR_PKG libhydrasdr)
  find_path(LIBHYDRASDR_INCLUDE_DIR NAMES libhydrasdr/hydrasdr.h
    PATHS
    ${LIBHYDRASDR_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBHYDRASDR_LIBRARIES NAMES hydrasdr
    PATHS
    ${LIBHYDRASDR_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

  if(LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)
    set(LIBHYDRASDR_FOUND TRUE CACHE INTERNAL "libhydrasdr found")
    message(STATUS "Found libhydrasdr: ${LIBHYDRASDR_INCLUDE_DIR}, ${LIBHYDRASDR_LIBRARIES}")
  else(LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)
    set(LIBHYDRASDR_FOUND FALSE CACHE INTERNAL "libhydrasdr found")
    message(STATUS "libhydrasdr not found.")
  endif(LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)

  mark_as_advanced(LIBHYDRASDR_INCLUDE_DIR LIBHYDRASDR_LIBRARIES)

endif(NOT LIBHYDRASDR_FOUND)
