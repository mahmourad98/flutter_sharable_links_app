import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:untitled02/app/my_app_router.dart';

class ReceiveSharedContentView extends StatefulWidget {
  final ReceiveSharedContentViewArgs args;
  const ReceiveSharedContentView({Key? key, required this.args,}) : super(key: key,);

  @override
  State<ReceiveSharedContentView> createState() => _ReceiveSharedContentViewState();
}

class _ReceiveSharedContentViewState extends State<ReceiveSharedContentView> {
  late final List<String> messages = <String>[
    ...(widget.args.uris.map((e) => e.toString()).toList()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                ],
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
