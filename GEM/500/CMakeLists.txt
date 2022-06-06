#---Setup the example project---------------------------------------------------
cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
project(GEM)

#---Find Garfield package-------------------------------------------------------
find_package(Garfield REQUIRED)

#---Build executable------------------------------------------------------------

add_executable(muon_track muon_track.C)
target_link_libraries(muon_track Garfield::Garfield)

#---Copy all files locally to the build directory-------------------------------
foreach(_file gemcell/mesh.header gemcell/mesh.elements gemcell/mesh.nodes gemcell/dielectrics.dat gemcell/gemcell.result)
  configure_file(${_file} ${_file} COPYONLY)
endforeach()

