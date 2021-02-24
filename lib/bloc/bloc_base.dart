import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class BlocEvent<T> {
  final String routeKey;
  final T argument;

  BlocEvent._(this.routeKey, this.argument);

  factory BlocEvent({@required String eventKey, T argument}) {
    return BlocEvent._(eventKey, argument);
  }
}

// Generic Interface for all BLoCs
abstract class BlocBase {
  final PublishSubject<BlocEvent> _uiEventsController =
  PublishSubject<BlocEvent>();
  final List<StreamSubscription> cleanUpSubscribers = []; //Compositeaubscription

  @protected
  Sink<BlocEvent> get inUiEvents => _uiEventsController.sink;

  Stream<BlocEvent> get outUiEvents => _uiEventsController.stream;

  void dispose() {
    cleanUpSubscribers.forEach((element) => element.cancel());
    cleanUpSubscribers.clear();
    _uiEventsController.close();
  }
}
