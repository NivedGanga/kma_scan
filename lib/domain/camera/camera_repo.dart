import 'package:camera/camera.dart';

class CameraRepo {
  CameraRepo._internal();
  static CameraRepo instance = CameraRepo._internal();
  factory CameraRepo() {
    return instance;
  }
  CameraDescription? _camera;
  CameraDescription? get camera => _camera;
  setCamera(CameraDescription? camera) {
    _camera = camera;
  }
}
