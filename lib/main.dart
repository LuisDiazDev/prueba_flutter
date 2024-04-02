import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testing/prueba_main.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_)async{
  runApp(const TestAPP());
  });
}


