<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Flutter Vimeo

A Flutter package for playing Vimeo videos using the InAppWebView plugin. This package provides a customizable Vimeo player widget with various controls and event callbacks.

## Features

- Play Vimeo videos using InAppWebView
- Customizable player settings:
  - Auto-play
  - Looping
  - Muted
  - Show/hide title
  - Show/hide byline
  - Show/hide controls
  - Enable/disable DNT (Do Not Track)
- Event callbacks for:
  - Video ready
  - Play
  - Pause
  - Finish
  - Seek
  - Time update
- Fullscreen support
- Background color customization
- Start time configuration

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_vimeo: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_vimeo/flutter_vimeo.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterVimeoPlayer(
      videoId: '123456789', // Replace with your Vimeo video ID
    );
  }
}
```

### Advanced Usage

```dart
FlutterVimeoPlayer(
  videoId: '123456789',
  isAutoPlay: true,
  isLooping: false,
  isMuted: false,
  showTitle: true,
  showByline: true,
  showControls: true,
  enableDNT: true,
  startTime: 0.0,
  backgroundColor: Colors.black,
  onReady: (totalDuration, currentDuration) {
    debugPrint('Video ready: Total duration: $totalDuration');
  },
  onPlay: (totalDuration, currentDuration) {
    debugPrint('Video playing: Current duration: $currentDuration');
  },
  onPause: (totalDuration, currentDuration) {
    debugPrint('Video paused: Current duration: $currentDuration');
  },
  onFinish: (totalDuration, currentDuration) {
    debugPrint('Video finished');
  },
  onSeek: (totalDuration, currentDuration) {
    debugPrint('Video seeked to: $currentDuration');
  },
  onTimeUpdate: (totalDuration, currentDuration) {
    debugPrint('Time updated: $currentDuration');
  },
)
```

## Getting a Vimeo Video ID

To get a Vimeo video ID:

1. Go to the Vimeo video you want to play
2. Copy the ID from the URL
   - Example: For `https://vimeo.com/123456789`, the ID is `123456789`

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `videoId` | String | required | The Vimeo video ID |
| `isAutoPlay` | bool | false | Whether to auto-play the video |
| `isLooping` | bool | false | Whether to loop the video |
| `isMuted` | bool | false | Whether to mute the video |
| `showTitle` | bool | false | Whether to show the video title |
| `showByline` | bool | false | Whether to show the video byline |
| `showControls` | bool | true | Whether to show video controls |
| `enableDNT` | bool | true | Whether to enable Do Not Track |
| `startTime` | double | 0.0 | Start time in seconds |
| `backgroundColor` | Color | Colors.black | Background color of the player |
| `onReady` | DurationCallBack? | null | Called when the video is ready |
| `onPlay` | DurationCallBack? | null | Called when the video starts playing |
| `onPause` | DurationCallBack? | null | Called when the video is paused |
| `onFinish` | DurationCallBack? | null | Called when the video finishes |
| `onSeek` | DurationCallBack? | null | Called when seeking in the video |
| `onTimeUpdate` | DurationCallBack? | null | Called when the video time updates |

## Example

See the [example](example) directory for a complete example application.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


