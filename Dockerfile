FROM centurylink/ca-certs

COPY twig /
EXPOSE 80
ENTRYPOINT ["/twig"]
