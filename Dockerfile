FROM jackfirth/racket:6.12 as build
WORKDIR /app
COPY src/ /app
RUN raco pkg install --auto --batch
RUN raco make main.rkt
RUN raco exe main.rkt
RUN raco distribute dist main

FROM scratch
WORKDIR /app

# Copy over the binary and included modules
COPY --from=build /app/dist/ /app

# Copy over libraries required by Racket
COPY --from=build /lib/x86_64-linux-gnu/libpthread.so.* /lib/
COPY --from=build /lib/x86_64-linux-gnu/libc.so.* /lib/
COPY --from=build /lib/x86_64-linux-gnu/libdl.so.* /lib/
COPY --from=build /lib/x86_64-linux-gnu/libm.so.* /lib/
COPY --from=build /lib64/ld-linux-x86-64.so.* /lib64/

# Copy over ld, because if we don't, NOTHING works
COPY --from=build /lib/x86_64-linux-gnu/ld* /lib/

CMD ["/app/bin/main"]
