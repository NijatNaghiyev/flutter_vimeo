import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vimeo/src/flutter_vimeo_player.dart';

void main() {
  group('FlutterVimeoPlayer', () {
    test('should throw assertion error when videoId is empty', () {
      expect(() => FlutterVimeoPlayer(videoId: ''), throwsAssertionError);
    });

    test('should create widget with valid videoId', () {
      final widget = FlutterVimeoPlayer(videoId: '123456789');
      expect(widget.videoId, '123456789');
    });

    test('should create widget with default values', () {
      final widget = FlutterVimeoPlayer(videoId: '123456789');
      expect(widget.isAutoPlay, false);
      expect(widget.isLooping, false);
      expect(widget.isMuted, false);
      expect(widget.showTitle, false);
      expect(widget.showByline, false);
      expect(widget.showControls, true);
      expect(widget.enableDNT, true);
      expect(widget.startTime, 0.0);
      expect(widget.backgroundColor, Colors.black);
      expect(widget.showLog, false);
    });

    test('should create widget with custom values', () {
      final widget = FlutterVimeoPlayer(
        videoId: '123456789',
        isAutoPlay: true,
        isLooping: true,
        isMuted: true,
        showTitle: true,
        showByline: true,
        showControls: false,
        enableDNT: false,
        startTime: 10.0,
        backgroundColor: Colors.blue,
        showLog: true,
      );

      expect(widget.isAutoPlay, true);
      expect(widget.isLooping, true);
      expect(widget.isMuted, true);
      expect(widget.showTitle, true);
      expect(widget.showByline, true);
      expect(widget.showControls, false);
      expect(widget.enableDNT, false);
      expect(widget.startTime, 10.0);
      expect(widget.backgroundColor, Colors.blue);
      expect(widget.showLog, true);
    });
  });
}
