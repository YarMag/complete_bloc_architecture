import 'package:complete_bloc_architecture/modules/common/error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

/// Простой контроллер сообщений. Максимально туп, показывает только снеки с помощью ключа
class DummyMessageController extends MessageController {
  /// Он же устанавливается в скаффолд
  final GlobalKey<ScaffoldState> scaffoldKey;

  DummyMessageController(this.scaffoldKey);

  @override
  void show({String msg, Object msgType}) {
    var scaffold = scaffoldKey.currentState;
    if (msgType == MsgType.common) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
    } else if (msgType == MsgType.special) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
