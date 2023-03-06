import 'package:flutter/services.dart';

class CopyAndPasteClipboardService {
  static Future<String> getClipboardData() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain,);
    return data?.text ?? "";
  }

  static Future<void> copyToClipboard(String text,) async {
    return await Clipboard.setData(ClipboardData(text: text,),);
  }
}