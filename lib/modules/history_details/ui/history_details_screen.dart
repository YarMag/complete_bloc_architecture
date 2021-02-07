
import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/history_details/bloc/history_details_bloc_interface.dart';
import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  IHistoryDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History details")),
      body: Center(
        child: Container(height: 300, child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_bloc.historyItem.title),
            Text(_bloc.historyItem.description),
            Text(_bloc.historyItem.date.toIso8601String())
          ],
        ),),
      ),
    );
  }
}