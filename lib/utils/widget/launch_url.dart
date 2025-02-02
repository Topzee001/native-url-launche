import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LaunchUrl {
  static Future<void> urlLaunch(BuildContext context, String url) async {
    try {
      bool success = await launchURL(url);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'Opening URL...' : 'Failed to open URL'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  static Future<bool> launchURL(String url) async {
    const platform = MethodChannel('app/url_launcher');
    try {
      final bool result =
          await platform.invokeMethod('launchUrl', {'url': url});
      return result;
    } on PlatformException {
      rethrow;
    }
  }
}
