import 'package:complete_bloc_architecture/modules/common/controllers/message_controller.dart';
import 'package:mwwm/mwwm.dart';

enum MsgType { common, special }

class DummyErrorHandler extends ErrorHandler {
  final MessageController _controller;

  DummyErrorHandler(this._controller);

  @override
  void handleError(Object e) {
    if (e is Exception) {
      _controller.show(msg: "Some trouble exist!", msgType: MsgType.common);
    }

    if (e is Error) {
      _controller.show(msg: "Some trouble exist!", msgType: MsgType.special);
    }
  }
}
