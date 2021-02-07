import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/entities/settings_item.dart';
import 'package:complete_bloc_architecture/modules/settings/bloc/settings_bloc_interface.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ISettingsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
    _bloc.startup();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SettingsItem>>(
      stream: _bloc.outSettings,
      builder:
          (BuildContext context, AsyncSnapshot<List<SettingsItem>> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(snapshot.data[index].title);
            })
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
