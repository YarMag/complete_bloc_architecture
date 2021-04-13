import 'dart:async';

import 'package:flutter/material.dart';

class Coordinator {
  final BuildContext _context;

  Coordinator(this._context);

  void navigate(String to, {dynamic arg}) {
    Navigator.pushNamed(_context, to, arguments: arg);
  }
}
