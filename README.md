## Minio Docker image clone

Images are built from Go sources. Each image also embeds its source as a
`.tar.gz` in case MinIO deletes its GitHub repo. To extract it:

```bash
docker create --name tmp paskalmaksim/minio:RELEASE.2025-10-15T17-29-55Z
docker cp tmp:/minio.tar.gz .
docker rm tmp
```

(use `/mc.tar.gz` and the `mc` image for the client sources)

### Minio client
```bash
docker pull paskalmaksim/mc:RELEASE.2025-08-13T08-35-41Z
```

### Minio server
```bash
docker pull paskalmaksim/minio:RELEASE.2025-10-15T17-29-55Z
```