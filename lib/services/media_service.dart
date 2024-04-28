import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaService {
  final ImagePicker _picker;

  MediaService(this._picker);

  Future<List<String>?> pickImagesFomDevice() async {
    await Permission.accessMediaLocation.request();
    if (await Permission.accessMediaLocation.isGranted) {
      final List<XFile?> xFiles = await _picker.pickMultiImage();
      final List<String> images = [];
      for (var xFile in xFiles) {
        if (xFile != null) {
          File file = File(xFile.path);
          List<int> imageBytes = file.readAsBytesSync();
          String base64Image = base64Encode(imageBytes);
          images.add(base64Image);
        }
      }
      return images;
    }
    return null;
  }

  Future<File?> pickVideoFromDevice() async {
    await Permission.accessMediaLocation.request();
    if (await Permission.accessMediaLocation.isGranted) {
      XFile? xFile = await _picker.pickVideo(source: ImageSource.gallery);
      if (xFile != null) {
        return File(xFile.path);
      }
    }
    return null;
  }

  Future<bool> isMediaLocationPermanentlyDenied() async {
    return await Permission.accessMediaLocation.isPermanentlyDenied;
  }
}
