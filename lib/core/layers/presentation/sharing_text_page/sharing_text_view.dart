import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharingTextView extends StatefulWidget {
  const SharingTextView({super.key,});

  @override
  _SharingTextViewState createState() => _SharingTextViewState();
}

class _SharingTextViewState extends State<SharingTextView> {
  final List<String> messages = <String>[
    "https://www.facebook.com",
    "https://twitter.com",
    "https://www.instagram.com",
    "https://www.tiktok.com",
    "https://www.youtube.com",
    "https://music.youtube.com"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sharing Links Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ...messages.map(
              (e,) => Row(
                children: [
                  Expanded(child: Center(child: Text(e,)),),
                  IconButton(
                    onPressed: () => shareText(
                      (Uri.tryParse(e,) ?? e).toString(),
                    ).then(
                      (value,) =>  log("result: $value", name: "Sharing Text Page"),
                    ),
                    icon: const Icon(Icons.share,),
                  ),
                ],
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  Future<bool> shareText(String text,) async {
    /*return await Share.share(text,);*/
    final shareResult = await Share.shareWithResult(text,);
    log("${shareResult.raw} || ${shareResult.status}", name: "Sharing Text Page");
    return (shareResult.status == ShareResultStatus.success) ? true : false;
  }
}
