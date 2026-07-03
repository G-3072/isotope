CC := gcc

TARGET := isotope

SRC_DIR := core
BUILD_DIR := build

INC_DIRS := ${filter %/include, ${shell find ${SRC_DIR} -type d}}
INC_FLAGS := ${addprefix -I,${INC_DIRS}}

CFLAGS := ${INC_FLAGS} -g -Wall -Werror
LDFLAGS :=

SRCS := ${shell find ${SRC_DIR} -name '*.c'}

OBJECTS := ${SRCS:%=${BUILD_DIR}/%.o}

${BUILD_DIR}/${TARGET}: ${OBJECTS}
	${CC} ${OBJECTS} -o $@ ${LDFLAGS}

${BUILD_DIR}/%.c.o: %.c
	mkdir -p ${dir $@}
	${CC} ${CFLAGS} -c $< -o $@

clean:
	rm -rf ${BUILD_DIR}/**

run: ${BUILD_DIR}/${TARGET}
	${BUILD_DIR}/${TARGET}
