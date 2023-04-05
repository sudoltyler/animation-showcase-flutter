import 'package:flutter/material.dart';
import '../Resources/animations.dart';

class AnimationSelectionWidget extends StatefulWidget {
  final ValueChanged<Animations> animationCallBack;  // callback to pass animation
  final ValueChanged<int> indexCallBack;             // callback to pass index
  final Animations? animationSelected;

  const AnimationSelectionWidget({
    super.key,
    required this.animationCallBack,
    required this.indexCallBack,
    this. animationSelected
  });

  @override
  State<AnimationSelectionWidget> createState() => _AnimationSelectionWidget();
}

class _AnimationSelectionWidget extends State<AnimationSelectionWidget> {
  static int _selectedIndex = -1;

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _onSelected(_selectedIndex);
    return Scaffold(
      appBar: AppBar(title: const Text('Pokeball Animations')),
      body: Center(
        child: Column(
          children: <Widget> [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, _) => const SizedBox(height: 20),
                itemCount: animationList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // callback to initiate new page with selected animation
                    onTap: () {
                      _onSelected(index);
                      widget.animationCallBack(animationList[index]);
                      widget.indexCallBack(index);
                    },
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 50.0),
                        elevation: 5.0,
                        child: Row (
                          children: <Widget> [
                            const SizedBox(width: 50),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(animationList.elementAt(index).image
                                  ),
                                  fit: BoxFit.fill
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 100,),

                            Column(
                              children: <Widget> [
                                const SizedBox(height: 50),
                                SizedBox(
                                  child: Text(
                                    animationList.elementAt(index).title,
                                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                SizedBox(child: Text(animationList.elementAt(index).isExplicit
                                                ? "Explicit Animation" : "Implicit Animation")
                                )
                              ],
                            )
                          ],
                        )
                      ),
                    ),

                  );
                }
              ),
            ),
          ]
        ),
      ),
    );
  }
}
