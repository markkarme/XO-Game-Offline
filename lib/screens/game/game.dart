import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xogame/cubit/xo_cubit.dart';
import 'package:xogame/cubit/xo_state.dart';
import 'package:xogame/general_components/holder.dart';

import 'gome_body.dart';
class XOGameHome  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => XOCubit(),
      child: BlocConsumer<XOCubit,XOStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              centerTitle: true,
              title: Text("XOGame"),
              backgroundColor: Colors.transparent,
            ),
            body: XOGameBody(),
          );
        },
      ),
    );
  }
}
