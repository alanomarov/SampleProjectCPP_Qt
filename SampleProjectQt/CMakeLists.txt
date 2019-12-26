cmake_minimum_required(VERSION 3.9)
project(sample_project_qt)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED on)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# detect the current platform
if(WIN32)
	if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
		set(PLATFORM "x64")
	else()
		set(PLATFORM "Win32")
	endif()
elseif(APPLE)
	set(PLATFORM "mac")
else()
	set(PLATFORM "linux")
endif()
message(STATUS "Platfom: ${PLATFORM}")

# set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PLATFORM}/${CMAKE_BUILD_TYPE})
message(STATUS "Output directory: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")

# def
add_definitions(
  -D_SCL_SECURE_NO_WARNINGS     # disable warning on "calling potentially unsafe methods in the Standard C++ Library"
)

# Qt
find_package(Qt5 COMPONENTS Core Widgets)

# qt resources
set(QRESOURCES
  Resources/SampleApplication.qrc
)

# Qt wrap is much faster than using CMAKE_AUTO*
set(CMAKE_AUTOUIC OFF)
set(CMAKE_AUTORCC OFF)

file(GLOB_RECURSE UIS Sources/*.ui)

qt5_wrap_ui(UIS_MOC ${UIS})
qt5_add_resources(QRC_MOC ${QRESOURCES})

set_property(SOURCE ${UIS_MOC} ${QRC_MOC} PROPERTY SKIP_AUTOMOC ON) # hides warning about generated files

# application
file(GLOB_RECURSE HEADERS Sources/*.h)
file(GLOB_RECURSE SOURCES Sources/*.cpp Sources/*.c)
add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCES} ${HEADERS} ${UIS_MOC} ${QRC_MOC})

qt5_use_modules(${PROJECT_NAME} Core Widgets)

# verbose output
#set(CMAKE_VERBOSE_MAKEFILE ON)
