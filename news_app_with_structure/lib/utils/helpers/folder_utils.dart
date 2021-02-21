import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FolderUtils {
  String folderName = 'NewsAppWithStructure';

  /// presentation_structure :: need to change folder name as app name

  Future<String> createFolderInAppDocDir() async {
    //App Document Directory + folder name
    final Directory dir = await getExternalStorageDirectory();
    final Directory _appDocDirFolder = Directory('${dir.path}/$folderName/');
    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  Future<bool> isFileExists(String fileName) async {
    final String dirPath = await createFolderInAppDocDir();
    final File file = File(dirPath + fileName);
    final bool isExist = await file.exists();

    return Future<bool>.value(isExist);
  }

  Future<File> getFile(String fileName) async {
    final String dirPath = await createFolderInAppDocDir();
    final File file = File(dirPath + fileName);
    return Future<File>.value(file);
  }

  String getFileName(String filePath) {
    if (filePath.isNotEmpty && filePath.contains('/')) {
      return filePath.split('/').last;
    } else {
      return '';
    }
  }
}
