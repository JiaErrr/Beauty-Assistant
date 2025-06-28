import 'package:get_it/get_it.dart';

import '../features/auth/di/auth_module.dart';
import '../features/camera/di/camera_module.dart';

class AppModule {
  static final GetIt sl = GetIt.instance;

  static Future<void> init() async {
    // Register feature modules
    await AuthModule.init(sl);
    await CameraModule.init(sl);
    
    // Register app-wide dependencies here
  }
}