
import 'package:flutter/foundation.dart';

class HistoryItem {
  final String title;
  final String description;
  final DateTime date;

  HistoryItem._(this.title, this.description, this.date);

  factory HistoryItem({@required String title, @required String description, @required DateTime date}) {
    return HistoryItem._(title, description, date);
  }
}