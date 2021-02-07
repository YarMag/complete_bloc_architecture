import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/default_error.dart';
import 'package:complete_bloc_architecture/modules/news/bloc/news_bloc_interface.dart';
import 'package:complete_bloc_architecture/navigation/alert_keys.dart';

class NewsBloc extends INewsBloc {
  void onLoadTap() {
    inUiEvents.add(BlocEvent(
        eventKey: AlertKeys.error,
        argument: DefaultError(
            title: "Something happened!", decription: "Please, try again")));
  }

  @override
  void dispose() {
    // left empty to prevent stream closing
  }
}
