cmake_minimum_required(VERSION 3.0)
project(BackupRestoreWithMakefile NONE) 
 
# Custom target to run the Makefile backup target
add_custom_target(
    backup
    COMMAND ${CMAKE_MAKE_PROGRAM} -C ${CMAKE_SOURCE_DIR} backup
    COMMENT "Running Makefile 'backup' target"
)

# Custom target to run the Makefile restore target
add_custom_target(
    restore
    COMMAND ${CMAKE_MAKE_PROGRAM} -C ${CMAKE_SOURCE_DIR} restore
    COMMENT "Running Makefile 'restore' target"
)