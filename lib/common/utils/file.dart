import 'package:path_provider/path_provider.dart';

abstract class FileUtils {
  static Future<String> generateFilePath(String ext) async {
    return "${(await getApplicationDocumentsDirectory()).path}/${DateTime.now().microsecondsSinceEpoch.toString()}.$ext";
  }
}
