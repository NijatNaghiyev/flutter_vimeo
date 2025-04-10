import 'dart:ui';

class TestMixin {
  String colorToHex(Color color) {
    final a =
        (color.a * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase();
    final r =
        (color.r * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase();

    final g =
        (color.g * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase();

    final b =
        (color.b * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase();

    return '#$r$g$b$a';
  }

  String buildIframeUrl({
    required String videoId,
    bool isAutoPlay = false,
    bool isLooping = false,
    bool isMuted = false,
    bool showTitle = false,
    bool showByline = false,
    bool showControls = true,
    bool enableDNT = true,
  }) {
    return 'https://player.vimeo.com/video/$videoId?'
        'autoplay=$isAutoPlay'
        '&loop=$isLooping'
        '&muted=$isMuted'
        '&title=$showTitle'
        '&byline=$showByline'
        '&controls=$showControls'
        '&dnt=$enableDNT';
  }

  String buildHtmlContent({
    required String videoId,
    required Color backgroundColor,
    required double startTime,
  }) {
    return '''
  <!DOCTYPE html>
  <html>
    <head>
      <style>
        body {
          margin: 0;
          padding: 0;
          background-color: ${colorToHex(backgroundColor)};
        }
        .video-container {
          position: relative;
          width: 100%;
          height: 100vh;
        }
        iframe {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
        }
      </style>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
      <script src="https://player.vimeo.com/api/player.js"></script>
    </head>
    <body>
      <div class="video-container">
        <iframe 
          id="player"
          src="${buildIframeUrl(videoId: videoId)}"
          frameborder="0"
          allow="autoplay; fullscreen; picture-in-picture"
          allowfullscreen 
          webkitallowfullscreen 
          mozallowfullscreen>
        </iframe>
      </div>
      <script>
        const player = new Vimeo.Player('player');
        player.ready().then(() => {
            player.setCurrentTime($startTime);
          });
      </script>
    </body>
  </html>
  ''';
  }
}
