# References 
## Contributing
- https://github.com/kubernetes-sigs/cluster-api/tree/main/docs
- https://kubernetes.io/docs/contribute/

## StyleGuide
- https://github.com/google/styleguide/tree/gh-pages

Build container image (copy out binary later)
```bash
docker build . -t mdbooktest
```

Run container, for testing
```bash
docker run --rm -p 3000:3000 mdbooktest mdbook serve
```