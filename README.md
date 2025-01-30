# Customized YouTube Downloader

Tool container, uses [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) to download a video or (possibly ongoing/waiting to start) live stream.

## Usage

Provide cookies in Netscape txt format, exported using an extension like ["Get cookies.txt LOCALLY" for Chrome](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc), save the file as `cookies\www.youtube.com_cookies.txt`. This allows to save membership content you have access to. If you do not want to use this feature, remove or comment the `--cookies` line in `yt-dlp.conf` before building the container.

Prepare folder `out/` to be mounted to save results. Adjust mounted paths from the examples below as needed.

```powershell
# build image
docker build -t youtube-downloader .

# invoke download
docker run -it --rm -v C:\Repos\yt-downloader\out:/output -v C:\Repos\yt-downloader\cookies:/cookies youtube-downloader <youtube video url>

# run interactive shell
docker run -it --rm -v C:\Repos\yt-downloader\out:/output -v C:\Repos\yt-downloader\cookies:/cookies youtube-downloader
```
