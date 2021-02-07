import 'package:complete_bloc_architecture/entities/history_item.dart';

abstract class IHistoryService {
  Future<List<HistoryItem>> loadHistory();
}