import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xogame/cubit/xo_state.dart';
import 'dart:math';

var dic = {
  "oPlayer": {
    "name": "oman",
    "symbol": "O",
  },
  "xPlayer": {
    "name": "xman",
    "symbol": "X",
  },
};
class XOCubit extends Cubit<XOStates> {
  XOCubit() : super(InitialStates());
  List indexs = [" ", " ", "", "", "", "", "", "", ""];
  String name = "mark";
  String turn = "X";
  List chnagedIndexes = [];
  int xPlayerWinners = 0;
  int oPlayerWinners = 0;
  var gameBodyContext;
  static XOCubit getCubit(context) {
    return BlocProvider.of(context);
  }

  void setTurn() {
    List symbols = ["X", "O"];
    Random random = new Random();
    int randomNumber = random.nextInt(2);
    turn = symbols[randomNumber];
    emit(SetingTurnSuccess());
  }

  void changeIndex(index, symbol, String turn) {
    if (chnagedIndexes.contains(index)) {
      print("NO");
    } else {
      indexs[index] = symbol;
      this.turn = turn;
      chnagedIndexes.add(index);
      print(chnagedIndexes);
      emit(SymbolChnagedState());
    }
    // print(!chnagedIndexes.contains(index));
  }

  Future addPlayersName(String xPlayer, String oPlayer) async {
    dic["oPlayer"]!["name"] = oPlayer;
    dic["xPlayer"]!["name"] = xPlayer;
    print(dic);
    emit(PlayersNameChanged());
  }

  void initalizeIndexs() {
    int i = 0;
    for (i = 0; i < 9; i++) {
      indexs[i] = "";
    }
    chnagedIndexes.clear();
    emit(InitialIndexsState());
  }

  void checkWinner() {
    int i = 0;
    for (i = 0; i < 9; i = i + 3) {
      if (indexs[i] + indexs[i + 1] + indexs[i + 2] == "XXX") {
        whoIsTheWinner("X");
        xPlayerWinners++;
        emit(XPlayerWin());
      } else if (indexs[i] + indexs[i + 1] + indexs[i + 2] == "OOO") {
        whoIsTheWinner("O");
        oPlayerWinners++;
        emit(OPlayerWin());
      }
    }
    for (i = 0; i < 3; i = i + 1) {
      if (indexs[i] + indexs[i + 3] + indexs[i + 6] == "XXX") {
        whoIsTheWinner("X");
        xPlayerWinners++;
        emit(XPlayerWin());
      } else if (indexs[i] + indexs[i + 3] + indexs[i + 6] == "OOO") {
        whoIsTheWinner("O");
        oPlayerWinners++;
        emit(OPlayerWin());
      }
    }
    if (indexs[0] + indexs[4] + indexs[8] == "XXX") {
      whoIsTheWinner("X");
      xPlayerWinners++;
      emit(XPlayerWin());
    } else if (indexs[0] + indexs[4] + indexs[8] == "OOO") {
      whoIsTheWinner("O");
      oPlayerWinners++;
      emit(OPlayerWin());
    } else if (indexs[2] + indexs[4] + indexs[6] == "XXX") {
      whoIsTheWinner("X");
      xPlayerWinners++;
      emit(XPlayerWin());
    } else if (indexs[2] + indexs[4] + indexs[6] == "OOO") {
      whoIsTheWinner("O");
      oPlayerWinners++;
      emit(OPlayerWin());
    }
  }

  void whoIsTheWinner(String symbol) {
    if (dic["oPlayer"]!["symbol"] == symbol) {
      print(dic["oPlayer"]!["name"]! + " win");
      showAlertDialog(gameBodyContext,dic["xPlayer"]!["name"]!);
      initalizeIndexs();
    } else if (dic["xPlayer"]!["symbol"] == symbol) {
      print(dic["xPlayer"]!["name"]! + " win");
      showAlertDialog(gameBodyContext,dic["oPlayer"]!["name"]!);
      initalizeIndexs();
    }
  }
  void showAlertDialog(BuildContext context,String loser) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
            title: Text("تعالي كل يوم"),
            content: Text(" ضعيف جدا جدا $loser"),
            actions: [
              ElevatedButton(
                child: Text("تاني"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]);
      },
    );
  }
}

