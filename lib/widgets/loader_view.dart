import 'package:flutter/material.dart';

class LoaderView extends StatelessWidget {
  final bool condition;
  final Widget child;

  const LoaderView({
    super.key,
    required this.condition,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (condition)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (condition)
          Center(
            child: CircularProgressIndicator(
              color: Colors.green[300],
              backgroundColor: Colors.grey,
            ),
          ),
      ],
    );
  }
}
