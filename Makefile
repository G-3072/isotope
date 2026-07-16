CC := gcc

TARGET := isotope

SRC_DIR := core
BUILD_DIR := build

INC_DIRS := ${filter %/inc, ${shell find ${SRC_DIR} -type d}}
INC_FLAGS := ${addprefix -I,${INC_DIRS}}

CFLAGS := ${INC_FLAGS} -g -Wall -Werror
AFLAGS := -g
LDFLAGS :=

CSRCS := ${shell find ${SRC_DIR} -name '*.c'} 
ASRCS := ${shell find ${SRC_DIR} -name '*.s'}
APSRCS := ${shell find ${SRC_DIR} -name '*.S'}

OBJECTS := ${CSRCS:%=${BUILD_DIR}/%.o} ${ASRCS:%=${BUILD_DIR}/%.o} ${ASRCS:%=${BUILD_DIR}/%.o}

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
	rm -rf ${BUILD_DIR}/**

run: ${BUILD_DIR}/${TARGET}
	${BUILD_DIR}/${TARGET}
# test targets

TEST_CC := ${BUILD_DIR}/${TARGET}

TEST_DIR := test

TEST_SRC_DIR := ${TEST_DIR}/src
TEST_BUILD_DIR := ${TEST_DIR}/build

TEST_INC_DIR := ${TEST_DIR}/inc

TEST_SOURCES := ${shell find ${TEST_SRC_DIR} -name '*.ci'}

TEST_TARGET := out

test_prj: ${BUILD_DIR}/${TARGET} ${TEST_SOURCES}
	${TEST_CC} ${TEST_SOURCES}


