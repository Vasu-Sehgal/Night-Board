# Night Board

A prototype (fake data) for night-shift dispatch. It is a static site with no backend, database or build step.

| File | What it is |
| --- | --- |
| `index.html` | Landing page linking to both views and the demo files |
| `dispatch.html` | Dispatch view: plan, Excel sync, recent changes, requests, tasks |
| `supervisor.html` | Supervisor view: tonight, calendar and overview |
| `demo/Rota_demo_before.xlsx`, `demo/Rota_demo_updated.xlsx` | Sample rota files. Upload them in Dispatch under Build, then Excel (before first, then updated) |

`dispatch.html` and `supervisor.html` load IBM Plex from Google Fonts, so the browser needs internet access for the fonts to load.

## Run locally (no Docker)

Open `index.html` in a browser, or serve the folder:

```sh
python3 -m http.server 8080
```

## Run with Docker Compose

Requires Docker with the Compose plugin.

```sh
docker compose up -d --build
```

Then open http://localhost:8080.

The image is `nginx:1.27-alpine` with the site files copied in (see [Dockerfile](Dockerfile)). The container restarts automatically unless stopped and has a healthcheck.

### Change the port

```sh
PORT=3000 docker compose up -d --build
```

Or put `PORT=3000` in a `.env` file next to `docker-compose.yml`.

### Common commands

```sh
docker compose ps          # status and health
docker compose logs -f     # follow logs
docker compose down        # stop and remove the container
```

After editing any HTML or demo file, rebuild with `docker compose up -d --build`. The files are baked into the image, not mounted.

## Hosting

Because the site is static, the simplest options are Cloudflare Pages, Netlify or GitHub Pages. They are free, give you HTTPS and need no server.

To host it with Docker on your own server:

1. Install Docker on a VPS and copy this repo to it.
2. Run `docker compose up -d --build`.
3. Put HTTPS in front of port 8080, for example with a Caddy container, or by proxying your domain through Cloudflare.
4. Open the firewall for ports 80 and 443 (and keep 8080 closed to the public if the proxy runs on the same host).
