import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';


import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OfflineWebsiteScreen extends StatefulWidget {
  @override
  _OfflineWebsiteScreenState createState() => _OfflineWebsiteScreenState();
}

class _OfflineWebsiteScreenState extends State<OfflineWebsiteScreen> {
  late String _offlineHTMLFilePath;

  @override
  void initState() {
    super.initState();
    _initializeOfflineAssets();
  }

  Future<void> _initializeOfflineAssets() async {
    try {
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      final offlineAssetsDirectory =
          '${appDocumentsDirectory.path}/offline_assets';

      await _createDirectoryIfNotExists(offlineAssetsDirectory);
      await _copyAssetToFile('assets/calci.html',
          '$offlineAssetsDirectory/calci.html');
      await _copyAssetToFile(
          'assets/style.css', '$offlineAssetsDirectory/style.css');

      _offlineHTMLFilePath = '$offlineAssetsDirectory/calci.html';

      setState(() {});
    } catch (e) {
      print('Error initializing offline assets: $e');
      // Handle the error appropriately (e.g., show an error dialog)
    }
  }

  Future<void> _createDirectoryIfNotExists(String path) async {
    final directory = Directory(path);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }

  Future<void> _copyAssetToFile(String assetPath, String filePath) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();

    final file = File(filePath);
    await file.writeAsBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Website'),
      ),
      body: _offlineHTMLFilePath.isNotEmpty
          ? WebView(
        initialUrl: 'file://$_offlineHTMLFilePath',
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
