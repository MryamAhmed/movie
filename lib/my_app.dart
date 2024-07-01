import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_screen.dart';
import 'features/watched_list/presentation/manager/togel_movie_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ToggleMovieCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
