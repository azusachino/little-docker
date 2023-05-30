FROM gcc:4.9
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN ["gcc", "-o", "app", "main.c"]
CMD ["./app"]
