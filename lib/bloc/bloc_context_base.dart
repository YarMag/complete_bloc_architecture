import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/default_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//По сути часть виджет модели
abstract class BlocContextBase<T extends BlocBase> {
  void subscribe(T bloc, BuildContext context);

  void goToRoute(String key, BuildContext context, {dynamic args}) {
    Navigator.pushNamed(context, key, arguments: args);
  }

  void replaceWithRoute(String key, BuildContext context) {
    Navigator.pushReplacementNamed(context, key);
  }

  void showError({@required DefaultError error, BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(error.title),
              content: Text(error.decription),
              actions: [FlatButton(onPressed: () {Navigator.of(context).pop();}, child: Text("OK"))],
            ));
  }
}
