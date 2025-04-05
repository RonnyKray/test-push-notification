import 'package:app/core/di/di_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/main/main_bloc_part.dart';

class AppInjectable extends StatefulWidget {
  const AppInjectable({required this.child, super.key});

  final Widget child;

  @override
  State<AppInjectable> createState() => _AppInjectableState();
}

class _AppInjectableState extends State<AppInjectable> {
  late MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = MainBloc(
      notificationService: DI.notificationService,
    )..add(MainEvent.initial());
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => mainBloc,
          ),
        ],
        child: widget.child,
      );
}
