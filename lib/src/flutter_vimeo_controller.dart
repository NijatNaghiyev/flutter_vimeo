import 'package:flutter_inappwebview/flutter_inappwebview.dart';

///? A controller for the [FlutterVimeoPlayer] widget.
///? It allows you to control the player and listen to events.
///? This controller is used internally by the [FlutterVimeoPlayer] widget.
class FlutterVimeoController {
  ///? Creates a [FlutterVimeoController] with the given [InAppWebViewController].
  ///? The [InAppWebViewController] is used to control the web view.
  FlutterVimeoController({required this.inAppWebViewController});

  ///? The [InAppWebViewController] used to control the web view.
  ///? This is the controller that is used to control the web view.
  final InAppWebViewController? inAppWebViewController;

  ///? The [videoId] is the ID of the video to be loaded.
  ///? The [videoId] is required and cannot be empty.
  void nextVideoWithJS(String nextVideoId) {
    final jsCode = "player.loadVideo($nextVideoId);";
    inAppWebViewController?.evaluateJavascript(source: jsCode);
  }
}
