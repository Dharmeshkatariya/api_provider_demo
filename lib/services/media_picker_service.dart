import 'dart:io';
import '../utils/export.dart';

class MediaPickerService {
  static Future<KPickedFile?> pickImageFromGallery(BuildContext context) async {
    return await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((result) {
      if (result != null) {
        return KPickedFile(
          fileName: result.name,
          filePath: result.path,
          fileSize: File(result.path).readAsBytesSync().lengthInBytes,
          extension: getFileExtension(result.path),
        );
      }
    }).onError((error, stackTrace) async {
      await Toaster.showInfo(message: error.toString());
      return null;
    });
  }

  static Future<KPickedFile?> pickImageFromCamera(BuildContext context) async {
    return await ImagePicker()
        .pickImage(source: ImageSource.camera)
        .then((result) {
      if (result != null) {
        return KPickedFile(
          fileName: result.name,
          filePath: result.path,
          fileSize: File(result.path).readAsBytesSync().lengthInBytes,
          extension: getFileExtension(result.path),
        );
      }
    }).onError((error, stackTrace) async {
      await Toaster.showInfo(message: error.toString());
      return null;
    });
  }

  static String getFileExtension(String filePath) {
    final file = File(filePath);
    return file.path.split('.').last;
  }
}

class KPickedFile {
  final String filePath;
  final String fileName;
  final String extension;
  final int fileSize;

  const KPickedFile({
    required this.filePath,
    required this.fileName,
    required this.extension,
    required this.fileSize,
  });
}
