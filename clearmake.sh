#This will clean up all the filth after
#cmake fails, like it does with me 99% of the time

clearmake(){
	rm CMakeCache.txt
	rm -rf CmakeFiles
	rm cmake_install.cmake
	rm Makefile
}


