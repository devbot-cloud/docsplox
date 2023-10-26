FROM rust:1.73 as build
ENV ARC="x86_64-unknown-linux-musl"
RUN rustup target add "${ARC}"
RUN cargo install mdbook --target "${ARC}"

FROM alpine
WORKDIR /book
COPY --from=build /usr/local/cargo/bin/mdbook /usr/bin/mdbook
COPY . .
ENTRYPOINT ["mdbook", "serve", "-n", "0.0.0.0"]