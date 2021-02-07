
import 'package:complete_bloc_architecture/services/startup/startup_service_interface.dart';

class StartupService implements IStartupService {
  @override
  Future<void> startup() {
    return Future.delayed(const Duration(seconds: 3));
  }

}