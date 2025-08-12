import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/result.dart';

class ApiClientService {
  ApiClientService() {
    _initWebViewController();
  }
  static final Dio _dio = Dio();
  static late WebViewController _controller;
  static bool _isInitialized = false;
  static final String _desktopUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36';
  static Completer<void> _pageLoadedCompleter = Completer<void>();

  // 初始化后台WebView控制器
  static Future<void> _initWebViewController() async {
    if (_isInitialized) return;
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setUserAgent(_desktopUserAgent)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) {
                if (!_pageLoadedCompleter.isCompleted) {
                  _pageLoadedCompleter.complete();
                }
              },
            ),
          );
    _isInitialized = true;
  }

  // HTML 解码函数
  String _decodeHtml(String rawHtml) {
    String decodedHtml = rawHtml;

    // 首先处理 JSON 字符串转义
    try {
      // 如果是 JSON 编码的字符串，先解码
      decodedHtml = jsonDecode('"$rawHtml"');
    } catch (e) {
      // 如果 JSON 解码失败，手动处理常见的转义字符
      decodedHtml = rawHtml
          .replaceAll(r'\"', '"')
          .replaceAll(r'\\', '\\')
          .replaceAll(r'\/', '/')
          .replaceAll(r'\n', '\n')
          .replaceAll(r'\r', '\r')
          .replaceAll(r'\t', '\t');
    }

    // Unicode 转义序列解码
    decodedHtml = decodedHtml.replaceAllMapped(RegExp(r'\\u([0-9a-fA-F]{4})'), (
      Match match,
    ) {
      int codeUnit = int.parse(match.group(1)!, radix: 16);
      return String.fromCharCode(codeUnit);
    });

    // 常见的 HTML 实体解码
    final Map<String, String> htmlEntities = {
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&quot;': '"',
      '&apos;': "'",
      '&nbsp;': ' ',
    };

    htmlEntities.forEach((entity, replacement) {
      decodedHtml = decodedHtml.replaceAll(entity, replacement);
    });

    return decodedHtml;
  }

  // 直接获取HTML内容
  Future<Result<String>> getSiteHtml({required String url}) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Result.ok(response.data.toString());
      } else {
        return Result.error(
          DioException(
            requestOptions: response.requestOptions,
            message: 'HTTP ${response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return Result.error(Exception('连接超时'));
        case DioExceptionType.receiveTimeout:
          return Result.error(Exception('接收超时'));
        case DioExceptionType.badResponse:
          return Result.error(Exception('服务器错误: ${e.response?.statusCode}'));
        case DioExceptionType.cancel:
          return Result.error(Exception('请求取消'));
        default:
          return Result.error(Exception('网络错误: ${e.message}'));
      }
    } catch (e) {
      return Result.error(Exception('未知错误: $e'));
    }
  }

  // 获取渲染后的HTML内容
  Future<Result<String>> getRenderedSiteHtml({required String url}) async {
    if (!_isInitialized) {
      await _initWebViewController();
    }
    try {
      _pageLoadedCompleter = Completer<void>();
      await _controller.loadRequest(Uri.parse(url));

      await _pageLoadedCompleter.future; // 等待页面加载完成
      var rawHtml =
          (await _controller.runJavaScriptReturningResult(
            'document.documentElement.outerHTML',
          )).toString();
      if (rawHtml.startsWith('"') && rawHtml.endsWith('"')) {
        rawHtml = rawHtml.substring(1, rawHtml.length - 1);
      }
      return Result.ok(_decodeHtml(rawHtml));
    } catch (e) {
      throw Exception('页面渲染失败: $e');
    }
  }
}
