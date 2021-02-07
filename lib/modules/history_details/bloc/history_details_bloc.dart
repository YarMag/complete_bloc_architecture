
import 'package:complete_bloc_architecture/entities/history_item.dart';
import 'package:complete_bloc_architecture/modules/history_details/bloc/history_details_bloc_interface.dart';

class HistoryDetailsBloc extends IHistoryDetailsBloc {
  final HistoryItem historyItem;

  HistoryDetailsBloc({this.historyItem});


}