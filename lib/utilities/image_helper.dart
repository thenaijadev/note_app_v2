import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<String?> pickImage(
    ImageSource source,
  ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return null;
      File? img = File(image.path);
      List<int> imageBytes = img.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      return base64Image;
    } on PlatformException catch (e) {
      print(e);
    }
    return null;
  }

  static Image decodeImage(String imageString) {
    String base64Image = imageString;
    Uint8List bytes = base64Decode(base64Image);
    Image image = Image.memory(bytes);
    return image;
  }
}
