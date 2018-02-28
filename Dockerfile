FROM jackfirth/racket:6.12 as build
WORKDIR /app
COPY src/ /app
RUN raco pkg install --auto --batch
RUN raco make main.rkt
RUN raco exe main.rkt
RUN raco distribute dist main

FROM jackfirth/racket:6.12
WORKDIR /app
COPY --from=0 /app/dist/ /app
CMD ["/app/bin/main"]
