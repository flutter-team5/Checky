import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

// ignore: camel_case_types
class Bottom_nav extends StatelessWidget {
  const Bottom_nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SnakeNavigationBarScreen(),
    );
  }
}

class SnakeNavigationBarScreen extends StatefulWidget {
  const SnakeNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _SnakeNavigationBar createState() => _SnakeNavigationBar();
}

class _SnakeNavigationBar extends State<SnakeNavigationBarScreen> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = CColors.ligthRed;
  Color unselectedColor = CColors.white;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      backgroundColor: CColors.darkGrey,
      height: 50,
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      shape: bottomBarShape,
      padding: padding,
      snakeViewColor: selectedColor,
      selectedItemColor:
          snakeShape == SnakeShape.indicator ? selectedColor : null,
      unselectedItemColor: unselectedColor,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,
      currentIndex: _selectedItemPosition,
      onTap: (index) => setState(() => _selectedItemPosition = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'tickets'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'tickets'),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
    );
  }

  void _onPageChanged(int page) {
    switch (page) {
      case 0:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.floating;
          snakeShape = SnakeShape.circle;
          padding = const EdgeInsets.all(12);
          bottomBarShape =
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
    }
  }
}

// class PagerPageWidget extends StatelessWidget {
//   final String? text;
//   final String? description;
//   final Image? image;
//   final TextStyle titleStyle =
//       const TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
//   final TextStyle subtitleStyle = const TextStyle(
//     fontSize: 20,
//     fontFamily: 'Ubuntu',
//     fontWeight: FontWeight.w200,
//   );

//   const PagerPageWidget({
//     Key? key,
//     this.text,
//     this.description,
//     this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       child: SafeArea(
//         child: OrientationBuilder(builder: (context, orientation) {
//           return orientation == Orientation.portrait
//               ? _portraitWidget()
//               : _horizontalWidget(context);
//         }),
//       ),
//     );
//   }

//   Widget _portraitWidget() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(text!, style: titleStyle),
//             const SizedBox(height: 16),
//             Text(description!, style: subtitleStyle),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _horizontalWidget(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(text!, style: titleStyle),
//               Text(description!, style: subtitleStyle),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
