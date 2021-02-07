import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/history_item.dart';
import 'package:complete_bloc_architecture/modules/history/bloc/history_bloc_interface.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/navigation/screen_args.dart';
import 'package:complete_bloc_architecture/services/history/history_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HistoryBloc extends IHistoryBloc {
  final IHistoryService _historyService;

  final PublishSubject<HistoryItem> _selectedItemSubject = PublishSubject();

  HistoryBloc({@required IHistoryService historyService})
      : _historyService = historyService {
    cleanUpSubscribers.add(_selectedItemSubject.stream.listen((event) {
      inUiEvents.add(BlocEvent(
          eventKey: RouteKeys.historyDetails,
          argument: HistoryDetailsArgs(item: event)));
    }));
  }

  @override
  Future<List<HistoryItem>> loadHistory() {
    return _historyService.loadHistory();
  }

  @override
  Sink<HistoryItem> get inSelectedItem => _selectedItemSubject.sink;

  @override
  void dispose() {
    // left empty to prevent stream closing
  }
}
