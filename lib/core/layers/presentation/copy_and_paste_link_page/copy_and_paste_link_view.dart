import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:untitled02/core/delegations/services/copy_and_paste_clipboard.dart';

class CopyAndPasteLinkPage extends StatefulWidget {
  const CopyAndPasteLinkPage({Key? key,}) : super(key: key,);

  @override
  State<CopyAndPasteLinkPage> createState() => _CopyAndPasteLinkPageState();
}

class _CopyAndPasteLinkPageState extends State<CopyAndPasteLinkPage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Copy & Paste",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0,),
              child: TextField(
                controller: textController,
                onSubmitted: (text,) async => {
                  await CopyAndPasteClipboardService.copyToClipboard(text,),
                },
                decoration: const InputDecoration(
                  hintText: "write here and submit to copy to clipboard....",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.all(Radius.circular(12.0,),),
                  )
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async => {
                  await CopyAndPasteClipboardService.getClipboardData().then(
                    (value,) => {
                      dev.log('copied text: $value', name: "Copied Text",),
                      setState(() => textController.text = value,),
                    },
                  ),
                },
                child: const Text('Paste',),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:  Colors.blueAccent,
                  textStyle: const TextStyle(fontSize: 18.0,),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
