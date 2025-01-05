# Customized YouTube Downloader

Tool container, uses [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) to download a video or (possibly ongoing/waiting to start) live stream which will then be transcoded using [Handbrake](https://handbrake.fr/) to reduce file size. Original video file will still be kept as `.orig`, since despite the "Fast 1080p30" preset producing decently compact files it may still be smaller.

Transcode is also skippable to save time. You can also skip the included transcode to then transcode the video in the software of your choice on the host machine that may have better hardware acceleration as the containerized tool.

## Usage

Provide cookies in Netscape txt format, exported using an extension like ["Get cookies.txt LOCALLY" for Chrome](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc), save the file as `cookies\www.youtube.com_cookies.txt`. This allows to save membership content you have access to. If you do not want to use this feature, remove or comment the `--cookies` line in `yt-dlp.conf` before building the container.

Prepare folder `out/` to be mounted to save results. Adjust mounted paths from the examples below as needed.

```powershell
# build image
docker build -t youtube-downloader .

# invoke download
docker run -it --rm -v C:\Repos\yt-downloader\out:/output -v C:\Repos\yt-downloader\cookies:/cookies youtube-downloader <youtube video url>
# invoke download but skip transcode (results in bigger video file)
docker run -it --rm -v C:\Repos\yt-downloader\out:/output -v C:\Repos\yt-downloader\cookies:/cookies youtube-downloader <youtube video url> notranscode

# run interactive shell
docker run -it --rm -v C:\Repos\yt-downloader\out:/output -v C:\Repos\yt-downloader\cookies:/cookies youtube-downloader
```
