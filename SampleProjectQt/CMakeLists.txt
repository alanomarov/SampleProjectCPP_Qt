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
set(SOURCES 
	Sources/Controllers/ControllerOne.cpp
	Sources/Controllers/ControllerOne.h
	Sources/Controllers/ControllerTwo.cpp
	Sources/Controllers/ControllerTwo.h

	Sources/Models/ModelOne.cpp
	Sources/Models/ModelOne.h
	Sources/Models/ModelTwo.cpp
	Sources/Models/ModelTwo.h

	Sources/Views/MainWindow.cpp
	Sources/Views/MainWindow.h
	Sources/Views/ViewOne.cpp
	Sources/Views/ViewOne.h
	Sources/Views/ViewTwo.cpp
	Sources/Views/ViewTwo.h
	
	Sources/main.cpp
)

# create source groups
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${SOURCES})
source_group(Resources FILES ${UIS} ${QRESOURCES}) 

add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCES} ${UIS_MOC} ${QRC_MOC})

include_directories (Sources)

qt5_use_modules(${PROJECT_NAME} Core Widgets)

# set project as startup project in VS
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

# verbose output
#set(CMAKE_VERBOSE_MAKEFILE ON)
