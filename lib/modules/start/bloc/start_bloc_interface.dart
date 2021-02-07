
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';

abstract class IStartBloc extends BlocBase {
  Future<void> startup();
}