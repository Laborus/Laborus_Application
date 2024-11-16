import 'dart:convert';
import 'dart:io';

class ImageModel {
  final String base64Data;
  final String? mimeType;
  final String? fileName;

  ImageModel({required this.base64Data, this.mimeType, this.fileName});

  Map<String, dynamic> toJson() => {
        'data': base64Data,
        'mimeType': mimeType,
        'fileName': fileName,
      };

  factory ImageModel.fromFile(File file) {
    final bytes = file.readAsBytesSync();
    final base64 = base64Encode(bytes);
    final extension = file.path.split('.').first.toLowerCase();
    final mimeType = 'image/$extension';

    return ImageModel(
      base64Data: base64,
      mimeType: mimeType,
      fileName: file.path.split('/').last,
    );
  }
}
