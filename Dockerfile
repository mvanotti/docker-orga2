FROM alpine:latest

RUN apk update && \
    apk add \
    vim bash nasm gcc g++ clang gdb \
    valgrind make mandoc man-pages \
    less libc-dev git subversion \
    python3 py3-pygments file \
    tar gzip imagemagick

# Dependencies required for installing bochs
RUN apk add flex bison linux-headers libx11-dev readline-dev

# Install mingw for cross-compiling bochs for windows.
RUN apk add mingw-w64-gcc mingw-w64-binutils mingw-w64-winpthreads mingw-w64-headers mingw-w64-crt

RUN rm -rf /var/cache/apk/*

RUN mkdir /code

# Setup gdb-dashboard
RUN wget -O /root/.gdbinit "https://git.io/.gdbinit"

# We use intel syntax instead of at&t (default).
RUN echo "set disassembly-flavor intel" >> "/root/.gdbinit"

# alpine and musl have some issues with valgrind.
# This downloads a suppression file to ignore memcheck errors on musl libc startup.
# See: https://bugs.kde.org/show_bug.cgi?id=426751
RUN wget -O /usr/lib/valgrind/default.supp "https://gist.githubusercontent.com/mvanotti/6933fb4b1369b75e5cf1331054cafa38/raw/48315b4a8b4670225356c9ac839f1e6a6913ebb2/alpine-musl.supp"

WORKDIR /code

CMD ["/bin/bash"]
