import 'dart:async';
import 'dart:developer';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class ReceiveSharedContentService {
  static StreamController<Uri>? _sharedContentStreamController;
  static StreamController<Uri>? get locationDataStreamController => _sharedContentStreamController;
  static StreamSubscription<Uri>? _sharedContentSubscription;
  static final List<Uri> messages = <Uri>[];

  static void initService() => {
    _sharedContentStreamController ??= StreamController<Uri>(),
    ReceiveSharingIntent.getInitialTextAsUri().then(
      (value,) => _sharedContentSubscription ??= ReceiveSharingIntent.getTextStreamAsUri().listen(
        _onSharedContentExists,
        onError: (_,) => log('Error Occurred', name: "ReceiveSharedContentView",),
        onDone: () => log('Stream Finished', name: "ReceiveSharedContentView",)
      ),
    ),
  };

  static void _onSharedContentExists(Uri data,) => _sharedContentStreamController?.add(data,);

  static void disposeService() => {
    _sharedContentSubscription?.cancel().then((_,) => _sharedContentSubscription = null,),
    _sharedContentStreamController?.close().then((_,) => _sharedContentStreamController = null,),
  };
}