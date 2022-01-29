import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_with_bloc/business_logic/cubit/pokedex_cubit.dart';
import 'package:pokedex_with_bloc/data/repositories/pokedex_repositories.dart';
import 'package:pokedex_with_bloc/screens/home_page/home_page.dart';
import 'package:pokedex_with_bloc/screens/home_page/test.dart';

void main() {
  runApp(const PokedexAppWithBloc());
}

class PokedexAppWithBloc extends StatelessWidget {
  const PokedexAppWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 16,
            ),
          ),
          textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              )),
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => PokedexCubit(PokedexRepositories()),
          child: HomePage(),
        ));
  }
}
