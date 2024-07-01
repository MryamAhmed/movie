import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/app_strings.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/models/movie_details_model.dart';
import 'my_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await _appSetup();
  runApp(const MyApp());
}

Future<void> _appSetup() async {
  await Hive.initFlutter();
  await Hive.openBox(AppStrings.hiveWatchedListBox);
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(MovieDetailsModelAdapter());
  }
  //Hive.registerAdapter(MovieDetailsModelAdapter());
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
}
