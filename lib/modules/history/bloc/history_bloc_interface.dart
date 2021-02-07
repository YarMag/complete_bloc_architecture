import 'package:complete_bloc_architecture/entities/history_item.dart';
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';

abstract class IHistoryBloc extends BlocBase {
  Future<List<HistoryItem>> loadHistory();

  Sink<HistoryItem> get inSelectedItem;
}