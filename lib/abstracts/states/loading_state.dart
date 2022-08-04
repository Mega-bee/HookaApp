import 'package:flutter/material.dart';
import 'package:hooka/abstracts/states/state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingState extends States {

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(color: Theme.of(context).primaryColor, size: 30)
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}

