FROM alpine

RUN apk update && \
    apk add vim bash nasm gcc clang gdb valgrind make mandoc man-pages less libc-dev && \
    rm -rf /var/cache/apk/*

RUN mkdir /code
WORKDIR /code

CMD ["/bin/bash"]
