import 'package:flutter/material.dart';

class SubHeaderHome extends StatelessWidget {
  const SubHeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          _item(
            child: Text(
              "TV Shows",
              style: _textStyle(),
            ),
          ),
          _item(
            child: Text(
              "Movies",
              style: _textStyle(),
            ),
          ),
          _myStuff(),
        ],
      ),
    );
  }

  TextStyle _textStyle() => const TextStyle(color: Colors.white, fontSize: 16);

  Expanded _item({required Widget child}) {
    return Expanded(
      child: Center(
        child: child,
      ),
    );
  }

  Widget _myStuff() {
    return SizedBox(
      width: 110,
      child: Row(
        children: [
          _item(
            child: Text(
              "Categories",
              style: _textStyle(),
            ),
          ),
          const Icon(Icons.arrow_drop_down_sharp, color: Colors.white,)
        ],
      ),
    );
  }
}
