import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/news/bloc/news_bloc.dart';
import 'package:complete_bloc_architecture/modules/news/bloc/news_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/news/bloc_context/news_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/news/ui/news_screen.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';

class NewsAssembly implements AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.map<INewsBloc>((i) => NewsBloc());

    injector.map<Widget>(
        (i) => BlocProvider(
            child: NewsScreen(),
            bloc: i.get<INewsBloc>(),
            blocContext: NewsBlocContext()),
        key: RouteKeys.news);
  }
}
