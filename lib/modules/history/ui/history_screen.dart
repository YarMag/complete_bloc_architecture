import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/history/bloc/history_bloc_interface.dart';
import 'package:flutter/material.dart';
import 'package:complete_bloc_architecture/entities/history_item.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  IHistoryBloc _bloc;

  Future<List<HistoryItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
    _itemsFuture = _bloc.loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _itemsFuture,
      builder:
          (BuildContext context, AsyncSnapshot<List<HistoryItem>> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text(snapshot.data[index].title),
                    onTap: () =>
                        _bloc.inSelectedItem.add(snapshot.data[index])))
            : CircularProgressIndicator();
      },
    );
  }
}
