CC := gcc

TARGET := isotope

SRC_DIR := core
BUILD_DIR := build

INC_DIRS := ${filter %/include, ${shell find ${SRC_DIR} -type d}}
INC_FLAGS := ${addprefix -I,${INC_DIRS}}

CFLAGS := ${INC_FLAGS} -g -Wall -Werror
AFLAGS := -g
LDFLAGS :=

CSRCS := ${shell find ${SRC_DIR} -name '*.c'} 
ASRCS := ${shell find ${SRC_DIR} -name '*.s'}
APSRCS := ${shell find ${SRC_DIR} -name '*.S'}

OBJECTS := ${SRCS:%=${BUILD_DIR}/%.o} ${ASMSRCS:%=${BUILD_DIR}/%.o}

srcs:
	echo ${CSRCS}
	echo ${ASRCS}
	echo ${APSRCS}

all:
	bear -- make build

build: ${BUILD_DIR}/${TARGET}

${BUILD_DIR}/${TARGET}: ${OBJECTS}
	${CC} ${OBJECTS} -o $@ ${LDFLAGS}

${BUILD_DIR}/%.c.o: %.c
	mkdir -p ${dir $@}
	${CC} ${CFLAGS} -c $< -o $@

${BUILD_DIR}/%.s.o: %.s
	mkdir -p ${dir $@}
	${CC} ${AFLAGS} -c $< -o $@

${BUILD_DIR}/%.S.o: %.S
	mkdir -p ${dir $@}
	${CC} ${AFLAGS} -c $< -o $@

clean:
	rm -rf build

run:
	./build/${TARGET}
