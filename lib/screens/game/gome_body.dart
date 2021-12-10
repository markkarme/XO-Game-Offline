
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xogame/cubit/xo_cubit.dart';
import 'package:xogame/cubit/xo_state.dart';
import 'package:xogame/general_components/holder.dart';

class XOGameBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<XOCubit, XOStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = XOCubit.getCubit(context);
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${myCubit.turn} TURN",style: TextStyle(color: Color(0xfffedf03),fontSize: 30),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${dic["xPlayer"]!["name"]}: ${myCubit.xPlayerWinners}",
                        style: TextStyle(color: Color(0xffff005d),fontSize: 30),),
                      Text("${dic["oPlayer"]!["name"]}: ${myCubit.oPlayerWinners}",
                        style: TextStyle(color: Color(0xffff005d),fontSize: 30),),
                    ],
                  ),
                ),
                SizedBox(height: size.height*.05,),
                Expanded(
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height/2.11),
                        crossAxisCount: 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0
                      ),
                      itemBuilder: (context, index) {
                        return HolderContainer(
                          X: myCubit.indexs[index],
                          onTap: (){
                            print(index);
                            myCubit.gameBodyContext = context;
                            if (myCubit.turn == "X"){
                              myCubit.changeIndex(index, "X","O");
                            }else{
                              myCubit.changeIndex(index, "O","X");
                            }
                            myCubit.checkWinner();
                          },
                        );
                      }),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xfffedf03)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),

                  onPressed: () {
                    myCubit.initalizeIndexs();
                  },
                  child: Text("Restart"),
                ),
                SizedBox(height: size.height*.1,),
              ],
          );
        });
  }
}
