
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/src/core/localization/app_localization.dart';
import 'package:testing/src/modules/alerts/alert_cubit.dart';
import 'package:testing/src/modules/home/bloc/home_bloc.dart';
import 'package:testing/src/modules/home/bloc/home_state.dart';
import 'package:testing/src/modules/session/session_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final alertCubit = BlocProvider.of<AlertCubit>(context);
    final sessionCubit = BlocProvider.of<SessionCubit>(context);

    return BlocProvider(
      create: (context) => HomeBloc(alertCubit, sessionCubit),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatefulWidget {
  const _BuildHomePage();

  @override
  State<_BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<_BuildHomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc,HomeState>(
      bloc: homeBloc,
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text("title".tr),
          ),
          body: Container(),

        );
      },
    );
  }

}