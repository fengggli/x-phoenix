# find comanche

if(NOT COMANCHE_PREFIX)
    message( FATAL_ERROR "need to set comanche root dir -DCOMANCHE_PREFIX" )
endif()
if(NOT PCI_ADDR_INPUT)
    message( FATAL_ERROR_INPUT "need to need pci addr of NVMe device" )
endif()
include_directories(${COMANCHE_PREFIX}/src/components/)
include_directories(${COMANCHE_PREFIX}/src/lib/common/include)
include_directories(${COMANCHE_PREFIX}/src/lib/core/include)
link_directories(${COMANCHE_PREFIX}/lib)
