import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

/// [WidgetModel] fo [MainScreen]
class MainScreenWidgetModel extends WidgetModel {
  MainScreenWidgetModel(
    WidgetModelDependencies dependencies,
    this._navigator,
    this.scaffoldKey,
  ) : super(dependencies);

  final NavigatorState _navigator;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final currentIndex = StreamedState<int>(0);
  final togglePage = Action<int>();

  @override
  void onLoad() {
    super.onLoad();
  }

  @override
  void onBind() {
    super.onBind(); 

    subscribe(togglePage.stream, (idx) {
      currentIndex.accept(idx);
    });
  }
}
