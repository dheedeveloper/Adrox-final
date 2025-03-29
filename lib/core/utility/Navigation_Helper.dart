import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void replaceWith(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndRemoveUntil({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void AnimatedNavigation({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  static void AnimatedNavigationdown({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const reverseBegin = Offset.zero;
          const reverseEnd = Offset(0.0, 1.0);

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn));
          var reverseTween = Tween(
            begin: reverseBegin,
            end: reverseEnd,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn));

          return SlideTransition(
            position: animation.drive(tween),
            child: SlideTransition(
              position: secondaryAnimation.drive(reverseTween),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
