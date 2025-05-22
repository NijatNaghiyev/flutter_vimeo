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

# Preview

<https://github.com/user-attachments/assets/f7c76ea4-b16a-4816-86ba-390f7de8566b>

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_vimeo: ^latest-version
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

### Advanced Usage with Controller

```dart
class AdvancedVimeoPlayerScreen extends StatefulWidget {
  const AdvancedVimeoPlayerScreen({super.key});

  @override
  State<AdvancedVimeoPlayerScreen> createState() => _AdvancedVimeoPlayerScreenState();
}

class _AdvancedVimeoPlayerScreenState extends State<AdvancedVimeoPlayerScreen> {
   FlutterVimeoController? controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Vimeo Player')),
      body: Column(
        children: [
          FlutterVimeoPlayer(
            videoId: '123456789',
            controller: controller,
            isAutoPlay: true,
            showTitle: true,
            backgroundColor: Colors.black,
            onInAppWebViewCreated: (controller){
              controller = FlutterVimeoController(
                              inAppWebViewController: controller);
            },
            onReady: (totalDuration, currentDuration) {
              debugPrint('Video ready: Total duration: $totalDuration');
            },
            onPlay: (totalDuration, currentDuration) {
              debugPrint('Video playing: Current duration: $currentDuration');
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => controller.play(),
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () => controller.pause(),
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () => controller.seekTo(30.0),
                child: const Text('Seek to 30s'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## FlutterVimeoController

The `FlutterVimeoController` provides methods to control the Vimeo player programmatically:

```dart
// Create a controller
FlutterVimeoController? controller;

onInAppWebViewCreated: (controller){
              controller = FlutterVimeoController(
                              inAppWebViewController: controller);
            },

// Play the video
controller?.nextVideoWithJS('987654321');
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
| `controller` | FlutterVimeoController? | null | Controller to manage the player programmatically |

## Example

See the [example](example) directory for a complete example application.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
