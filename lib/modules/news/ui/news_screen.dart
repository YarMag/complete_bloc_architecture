import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/news/bloc/news_bloc_interface.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  INewsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        child: Text("Load news"),
        onPressed: () => _bloc.onLoadTap(),
        color: Colors.blue,
      ),
    );
  }
}
