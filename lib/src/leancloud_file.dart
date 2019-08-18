import '../leancloud_functions.dart';

class AVFile extends AVObject {
  AVFile() : super('_File');

  AVFile.fromQueryBackString(String queriedString)
      : super.fromQueryBackString(queriedString);

  void put(String key, Object value) {
    super.put(key, value);
  }

  /// set file name
  void setFilename(String filename) {
    this.put("filename", filename);
  }

  /// set file path
  void setFilepath(String filepath) {
    this.put("filepath", filepath);
  }

  String getFilename() {
    return super.get('filename');
  }

  String getFilepath() {
    return super.get('filepath');
  }
  Future<AVFile> save() async {
    super.save();
    return this;
  }
  Future<AVFile> signUp() async {
    var leancloudFlutterPlugin = LeancloudFlutterPlugin.getInstance();
    String queriedString = await leancloudFlutterPlugin.saveWithAbsoluteLocalPath(this);
    return AVFile.fromQueryBackString(queriedString);
  }

}
