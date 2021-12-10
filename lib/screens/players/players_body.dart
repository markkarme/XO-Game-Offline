import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xogame/cubit/xo_cubit.dart';
import 'package:xogame/cubit/xo_state.dart';
import 'package:xogame/general_components/holder.dart';
import 'package:xogame/screens/game/game.dart';

class PlayersBody extends StatelessWidget {
  TextEditingController xPlayerName = TextEditingController();
  TextEditingController oPlayerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<XOCubit, XOStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = XOCubit.getCubit(context);
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    child: Image.asset("assets/XO.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff1ed5c3)),
                      controller: xPlayerName,
                      decoration: const InputDecoration(
                        labelText: 'X Player name',
                        labelStyle: TextStyle(
                          color: Color(0xfffedf03),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffedf03)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffedf03)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xff1ed5c3)),
                      controller: oPlayerName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'O Player name',
                        labelStyle: TextStyle(color: Color(0xfffedf03)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffedf03)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffedf03)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xff1ed5c3)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: () {
                      myCubit.addPlayersName(xPlayerName.text, oPlayerName.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return XOGameHome();
                      }));
                    },
                    child: Text("Play"),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
