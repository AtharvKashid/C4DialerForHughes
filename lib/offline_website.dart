import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class OfflineWebsite extends StatefulWidget {
  final String websiteUrl;

  OfflineWebsite({required this.websiteUrl});

  @override
  _OfflineWebsiteScreenState createState() => _OfflineWebsiteScreenState();
}

class _OfflineWebsiteScreenState extends State<OfflineWebsite> {
  late String _offlineHTMLFilePath;
  late String _offlineAssetsDirectory;

  @override
  void initState() {
    super.initState();
    _initializeOfflineAssets();
  }

  Future<void> _initializeOfflineAssets() async {
    try {
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      _offlineAssetsDirectory = '${appDocumentsDirectory.path}/offline_assets';
      await Directory(_offlineAssetsDirectory).create(recursive: true);
      await _downloadAssets(widget.websiteUrl);
      _offlineHTMLFilePath = '$_offlineAssetsDirectory/index.html';
      setState(() {});
    } catch (e) {
      print('Error initializing offline assets: $e');
      // Handle the error appropriately (e.g., show an error dialog)
    }
  }

  Future<void> _downloadAssets(String url) async {
    final response = await http.get(Uri.parse(url));
    final responseBytes = response.bodyBytes;
    final htmlFile = File('$_offlineAssetsDirectory/index.html');
    await htmlFile.writeAsBytes(responseBytes);
  }

  Future<bool> _checkOfflineAssetsAvailability() async {
    final htmlFile = File(_offlineHTMLFilePath);
    return htmlFile.exists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Website'),
      ),
      body: FutureBuilder<bool>(
        future: _checkOfflineAssetsAvailability(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return WebView(
              initialUrl: 'file://$_offlineHTMLFilePath',
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text('Website is not available offline.'),
            );
          }
        },
      ),
    );
  }
}
