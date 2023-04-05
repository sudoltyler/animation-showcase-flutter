
import 'package:flutter/material.dart';
import '../Resources/animations.dart';

class AnimationWidget extends StatefulWidget {
  final Animations selectedAnimation;

  const AnimationWidget({super.key, required this.selectedAnimation});

  @override
  State<AnimationWidget> createState() => _AnimationWidget();
}

class _AnimationWidget extends State<AnimationWidget> with SingleTickerProviderStateMixin {
  late bool pausePress = false;
  late bool actionPress = false;
  late Animations selectedAnimation;

  // only used for explicit animations
  late final AnimationController _controller = selectedAnimation.controllerFn(this);

  @override
  void dispose() {
    // deallocate AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedAnimation = widget.selectedAnimation;
  }

  Widget _animationWidget() {
    return Center(
      child: Row(
        children: <Widget> [
          Flexible(
            flex: 1,
            child: Stack (
              children: <Widget> [
                Container(
                  color: selectedAnimation.color,
                ),
                Center(child: SizedBox(
                  width: 180,
                  child: Text(selectedAnimation.desc, style: const TextStyle(fontSize: 20))),
                ),
              ]
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget> [
                Flexible (
                  flex: 4,
                  child: Center(
                    child: selectedAnimation.animationFn(actionPress, pausePress, selectedAnimation, _controller),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: selectedAnimation.isExplicit ?
                    Row (
                      children: <Widget> [
                        Expanded(
                          child: Center(
                            child: FloatingActionButton(
                              heroTag: "pauseButton",
                              backgroundColor: selectedAnimation.color,
                              onPressed: () => setState(() { pausePress = !pausePress; }),
                              child: pausePress ? const Icon(Icons.play_arrow_outlined) : const Icon(Icons.pause)
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center (
                            child: FloatingActionButton(
                              heroTag: "reverseButton",
                              backgroundColor: selectedAnimation.color,
                              onPressed: () => setState(() { actionPress = !actionPress; }),
                              child: actionPress ? const Icon(Icons.rotate_right) : const Icon(Icons.rotate_left)
                            ),
                          ),
                        ),
                      ],
                    ) :
                    FloatingActionButton (
                      heroTag: "actionButton",
                      backgroundColor: selectedAnimation.color,
                      onPressed: () => setState(() { actionPress = !actionPress; }),
                      child: const Icon(Icons.star_outline)
                    )
                )
              ]
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(selectedAnimation.title)),
      body: _animationWidget(),
    );
  }
}
