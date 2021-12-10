import 'package:flutter/material.dart';
import 'package:xogame/screens/game/game.dart';
import 'package:xogame/screens/players/players.dart';

import 'BlocObserver.dart';
import 'package:bloc/bloc.dart';
void main(){
  Bloc.observer = MyBlocObserver();
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: PlayersScreen(),
      )
  );
}