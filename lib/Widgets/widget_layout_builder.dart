import 'package:flutter/material.dart';
import 'package:project_3/Resources/animations.dart';
import 'package:project_3/Widgets/animation_selection_widget.dart';

import 'animation_widget.dart';

class WidgetLayoutBuilder extends StatefulWidget {
  const WidgetLayoutBuilder({super.key});

  @override
  State<WidgetLayoutBuilder> createState() => _WidgetLayoutBuilder();
}

class _WidgetLayoutBuilder extends State<WidgetLayoutBuilder> {
  late Animations _selectedAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimationSelectionWidget(
      animationCallBack: (animationSelected) {
        setState(() {
          _selectedAnimation = animationSelected;
        });
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, anotherAnimation) {
              return AnimationWidget(selectedAnimation: _selectedAnimation);
            },
            barrierColor: _selectedAnimation.color,
            transitionDuration: const Duration(milliseconds: 1500),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(curve: _selectedAnimation.curve, parent: animation);
              return _selectedAnimation.transitionFn(animation, child);
            }
          ),
        );
      },
      indexCallBack: (int value) {
        setState(() {
        });
      },
    );
  }
}
