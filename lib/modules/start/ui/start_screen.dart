import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/start/bloc/start_bloc_interface.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  IStartBloc _bloc;
  Future<void> _initComplete;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
    _initComplete = _bloc.startup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Startup screen"),
        ),
        body: Center(
          child: FutureBuilder(
              future: _initComplete,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text("Greetings!");
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
