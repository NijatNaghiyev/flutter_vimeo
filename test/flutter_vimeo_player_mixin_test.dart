import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_mixin.dart';

void main() {
  group('FlutterVimeoPlayerMixin', () {
    test('colorToHex converts Color to hex string correctly', () {
      final mixin = TestMixin();
      final color = Colors.blue;
      final hex = mixin.colorToHex(color);
      expect(hex, '#2196F3FF');
    });

    test('buildIframeUrl includes all parameters correctly', () {
      final mixin = TestMixin();
      final url = mixin.buildIframeUrl(
        videoId: '123456789',
        isAutoPlay: true,
        isLooping: true,
        isMuted: true,
        showTitle: true,
        showByline: true,
        showControls: true,
        enableDNT: true,
      );
      expect(url, contains('video/123456789'));
      expect(url, contains('autoplay=true'));
      expect(url, contains('loop=true'));
      expect(url, contains('muted=true'));
      expect(url, contains('title=true'));
      expect(url, contains('byline=true'));
      expect(url, contains('controls=true'));
      expect(url, contains('dnt=true'));
    });

    test('buildHtmlContent includes correct HTML structure', () {
      final mixin = TestMixin();
      final html = mixin.buildHtmlContent(
        videoId: '123456789',
        backgroundColor: Colors.blue,
        startTime: 0.0,
      );
      expect(html, contains('<!DOCTYPE html>'));
      expect(html, contains('<html>'));
      expect(html, contains('<head>'));
      expect(html, contains('<body>'));
      expect(html, contains('video-container'));
      expect(html, contains('player.vimeo.com/api/player.js'));
      expect(html, contains('Vimeo.Player'));
    });

    test('buildHtmlContent includes correct background color', () {
      final mixin = TestMixin();
      final html = mixin.buildHtmlContent(
        videoId: '123456789',
        backgroundColor: Colors.blue,
        startTime: 0.0,
      );
      expect(html, contains('background-color: #2196F3FF'));
    });

    test('buildHtmlContent includes correct iframe URL', () {
      final mixin = TestMixin();
      final html = mixin.buildHtmlContent(
        videoId: '123456789',
        backgroundColor: Colors.blue,
        startTime: 0.0,
      );
      expect(html, contains('src="https://player.vimeo.com/video/123456789'));
    });
  });
}
