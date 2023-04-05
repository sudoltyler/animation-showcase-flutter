import 'dart:math';

import 'package:flutter/material.dart';

class Animations{
  final int id;
  final bool isExplicit;
  final String title;
  final String desc;
  final String image;
  final Curve curve;
  final Color color;
  final Function animationFn;
  final Function controllerFn;
  final Function transitionFn;


  Animations({required this.id, required this.isExplicit, required this.title,
              required this.desc, required this.image, required this.curve,
              required this.color, required this.animationFn, required this.controllerFn,
              required this.transitionFn});
}

final List<Animations> animationList = <Animations> [
  // Implicit Animations
  Animations(
    id: 1, isExplicit: false, title: "Poke Ball", desc: "Implicit animation: Ball grows and shrinks",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/800px-Pokebola-pokeball-png-0.png",
    curve: Curves.bounceIn, color: Colors.redAccent,
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      return AnimatedContainer(
        width: actionPress ? 250 : 50,
        height: actionPress ? 250 : 50,
        duration: const Duration(milliseconds: 300),
        curve: selectedAnimation.curve,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
        ),
      );
    },
    controllerFn: (var x) { return AnimationController(vsync: x); },  // not used for implicit animation
    transitionFn: (Animation<double> animation, Widget child) {
      return SlideTransition(
        position:Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    }
  ),

  Animations(
    id: 2, isExplicit: false, title: "Great Ball", desc: "Implicit animation: Ball spins when button is pressed, on another press the ball spins the other direction",
    image: "https://static.wikia.nocookie.net/pokemon/images/a/ac/Great_Ball_Artwork.png/revision/latest?cb=20200918010231",
    curve: Curves.linear, color: Colors.blue,
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      return TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: actionPress ? 2.0 * pi : 0.0 * pi),
        builder: (_, double angle, __) {
          return Transform.rotate(
            angle: angle,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(selectedAnimation.image),
                  fit: BoxFit.contain),
              ),
            ),
          );
        }
      );
    },
    controllerFn: (var x) { return AnimationController(vsync: x); },  // not used for implicit animation
    transitionFn: (Animation<double> animation, Widget child) {
      return ScaleTransition(
        alignment: Alignment.bottomRight,
        scale: animation,
        child: child,
      );
    }  // not used for implicit animation
  ),

  Animations(
    id: 3, isExplicit: false, title: "Ultra Ball", desc: "Implicit animation: Image stretches on button press",
    image: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0ab12834-cebb-4832-80fc-780aad043d90/d93nt52-927c16c3-6260-42b0-a8eb-de13d39805d3.png/v1/fill/w_400,h_400,strp/ultra_ball_by_peetzaahhh2010_d93nt52-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDAwIiwicGF0aCI6IlwvZlwvMGFiMTI4MzQtY2ViYi00ODMyLTgwZmMtNzgwYWFkMDQzZDkwXC9kOTNudDUyLTkyN2MxNmMzLTYyNjAtNDJiMC1hOGViLWRlMTNkMzk4MDVkMy5wbmciLCJ3aWR0aCI6Ijw9NDAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.vuNgiCcxsgizambCZHBh5vBbHUHC0Fao4JXGroPAQe0",
    curve: Curves.decelerate, color: Colors.grey,
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      return AnimatedContainer(
        width: actionPress ? 500 : 200,
        height: actionPress ? 70 : 200,
        duration: const Duration(milliseconds: 1000),
        curve: selectedAnimation.curve,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.fill)
        ),
      );
    },
    controllerFn: (var x) { return AnimationController(vsync: x); },  // not used for implicit animation
    transitionFn: (Animation<double> animation, Widget child) {
      return RotationTransition(
        turns: animation,
        child: child,
      );
    }  // not used for implicit animation
  ),

  Animations(
    id: 4, isExplicit: false, title: "Master Ball", desc: "On button press, ball will fade out and disappear",
    image: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c861d306-8f42-4864-ab2e-61a271518c8a/df5v8as-456a4efd-1d86-4e1b-a9ff-0f85538d8625.png/v1/fill/w_1280,h_1281,strp/master_ball__pokemon_pinball__by_ace_zeroartic_df5v8as-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MSIsInBhdGgiOiJcL2ZcL2M4NjFkMzA2LThmNDItNDg2NC1hYjJlLTYxYTI3MTUxOGM4YVwvZGY1djhhcy00NTZhNGVmZC0xZDg2LTRlMWItYTlmZi0wZjg1NTM4ZDg2MjUucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.4ReIMhNfZXOSG2g_LsoY3DQGUsRkeuziEkC4PvfF9QI",
    curve: Curves.easeInOutCubic, color: const Color.fromRGBO(
      192, 116, 255, 1.0),
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      return AnimatedOpacity(
        opacity: actionPress ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        curve: selectedAnimation.curve,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
          ),
        )
      );
    },
    controllerFn: (var x) { return AnimationController(vsync: x); },  // not used for implicit animation
    transitionFn: (Animation<double> animation, Widget child) {
      return SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        axisAlignment: 0.0,
        child: child,
      );
    }  // not used for implicit animation
  ),

  // Explicit Animations
  Animations(
    id: 5, isExplicit: false, title: "Quick Ball", desc: "Implicit animation, on button press, the image will fade and show a different image",
    image: "https://static.wikia.nocookie.net/pokemon/images/b/be/Quick_Ball.png/revision/latest?cb=20110615192330",
    curve: Curves.easeInExpo, color: const Color.fromRGBO(116, 212, 255, 1.0),
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        sizeCurve: selectedAnimation.curve,
        crossFadeState: actionPress? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild:
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
            ),
          ),
        secondChild:
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/7/73/Pikachu_artwork_for_Pokémon_Red_and_Blue.webp/220px-Pikachu_artwork_for_Pokémon_Red_and_Blue.webp.png"), fit: BoxFit.fill)
            ),
          )
      );
    },
    controllerFn: (var x) { return AnimationController(vsync: x); },  // not used for implicit animation
    transitionFn: (Animation<double> animation, Widget child) {
      return RotationTransition(
        turns: animation,
        child: child,
      );
    }  // not used for implicit animation
  ),

  Animations(
    id: 6, isExplicit: true, title: "Dusk Ball", desc: "Explicit animation, ball rotates, can be paused and reversed with the buttons",
    image: "https://static.wikia.nocookie.net/pokemon/images/8/88/DuskBall.png/revision/latest?cb=20140126204805",
    curve: Curves.elasticIn, color: const Color.fromRGBO(6, 107, 4, 1.0),
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      pausePress? controller.stop() : controller.repeat(reverse: actionPress? true : false);

      late final Animation<double> expAnimation =
      CurvedAnimation(
        parent: controller,
        curve: selectedAnimation.curve,
      );

      return RotationTransition(
        turns: expAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
            ),
          ),
        ),
      );
    },
    controllerFn: (var x) {
      AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 3500),
        vsync: x,
      );

      return controller;
    },
    transitionFn: (Animation<double> animation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  ),

  Animations(
    id: 7, isExplicit: true, title: "Ancient Ball", desc: "Explicit animation, ball bounces up and down, animation can be paused and the repeat can be disabled with the buttons",
    image: "https://static.wikia.nocookie.net/pokemon/images/e/e6/OldPokéBall.png/revision/latest/scale-to-width-down/250?cb=20211106181208",
    curve: Curves.fastLinearToSlowEaseIn, color: const Color.fromRGBO(189, 111, 111, 1.0),
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      pausePress? controller.stop() : controller.repeat(reverse: actionPress? false : true);

      late final Animation<Offset> expAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.0,0.5)).animate(controller);

      return SlideTransition(
        position: expAnimation,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
          ),
        ),
      );
    },
    controllerFn: (var x) {
        AnimationController controller = AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: x,
        );

        return controller;
    },
    transitionFn: (Animation<double> animation, Widget child) {
      return ScaleTransition(
        alignment: Alignment.topCenter,
        scale: animation,
        child: child,
      );
    }
  ),

  Animations(
    id: 8, isExplicit: true, title: "Cherish Ball", desc: "Explicit animation, ball scales in size, can be paused and reversed with buttons",
    image: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c861d306-8f42-4864-ab2e-61a271518c8a/df4ndzu-552ecd31-6525-4fcd-a4bf-becb5a69a170.png/v1/fill/w_1280,h_1281,strp/cherish_ball_by_ace_zeroartic_df4ndzu-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MSIsInBhdGgiOiJcL2ZcL2M4NjFkMzA2LThmNDItNDg2NC1hYjJlLTYxYTI3MTUxOGM4YVwvZGY0bmR6dS01NTJlY2QzMS02NTI1LTRmY2QtYTRiZi1iZWNiNWE2OWExNzAucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.5zFOwpi7S6OkMyo0vrFvNgIwKXjWJFbHaaBbJMvSVsU",
    curve: Curves.slowMiddle, color: const Color.fromRGBO(182, 0, 0, 1.0),
    animationFn: (bool actionPress, bool pausePress, Animations selectedAnimation, AnimationController controller) {
      pausePress? controller.stop() : controller.repeat(reverse: actionPress? true : false);

      late final Animation<double> expAnimation =
      CurvedAnimation(
        parent: controller,
        curve: selectedAnimation.curve,
      );

      return ScaleTransition(
        scale: expAnimation,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(selectedAnimation.image), fit: BoxFit.cover)
          ),
        ),
      );
    },
    controllerFn: (var x) {
      AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: x,
      );

      return controller;
    },
    transitionFn: (Animation<double> animation, Widget child) {
      return SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: child,
      );
    }
  )
];


