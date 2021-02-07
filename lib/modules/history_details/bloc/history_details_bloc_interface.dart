
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/history_item.dart';

abstract class IHistoryDetailsBloc extends BlocBase {
  HistoryItem get historyItem;
}