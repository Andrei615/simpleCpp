# ## Сборка ---------------------------------------
# FROM gcc:latest as build
# #
# #WORKDIR /build
# #

# RUN apt-get update && apt-get install -y cmake
# RUN cmake --build .



# #    cmake --build . && \
# #    mv lib*.a /usr/lib


# ADD /Users/andrei/Desktop/simpleCpp /app/src


# WORKDIR /app/build


# RUN cmake ../src && \
#     cmake --build . && \
#     CTEST_OUTPUT_ON_FAILURE=TRUE cmake --build . --target test


# FROM ubuntu:latest


# RUN groupadd -r sample && useradd -r -g sample sample
# USER sample

# # Установим рабочую директорию нашего приложения
# WORKDIR /app

# COPY --from=build /app/build/mainTest .

# # Установим точку входа
# ENTRYPOINT ["./mainTest"]


FROM gcc:latest as build

# RUN apt-get update && apt-get -y --no-install-recommends install \
#     build-essential \
#     cmake \
#     cpp 


RUN apt-get update && \
    apt-get install -y \
    cmake 

ADD . /app/src


WORKDIR /app/build

RUN cmake ../src && \
    cmake --build .

FROM ubuntu:latest

RUN groupadd -r sample && useradd -r -g sample sample
USER sample

WORKDIR /app

COPY --from=build /app/build/mainTest .

ENTRYPOINT ["./mainTest"]
