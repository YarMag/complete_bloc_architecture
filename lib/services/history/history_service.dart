import 'package:complete_bloc_architecture/entities/history_item.dart';
import 'package:complete_bloc_architecture/services/history/history_service_interface.dart';

class HistoryService implements IHistoryService {
  @override
  Future<List<HistoryItem>> loadHistory() {
    return Future.delayed(
        const Duration(seconds: 2),
        () => [
              HistoryItem(
                  title: "News #1",
                  description: "Some great event was happened",
                  date: DateTime.now().subtract(Duration(days: 4))),
              HistoryItem(
                  title: "News #2",
                  description: "Another day, another life",
                  date: DateTime.now().subtract(Duration(days: 2)))
            ]);
  }
}
