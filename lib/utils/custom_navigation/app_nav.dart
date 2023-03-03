import 'package:flutter/cupertino.dart';

normalNav({required BuildContext context, required Widget screen}) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (ctx) => screen),
  );
}

void pushAndRemoveUntil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(builder: (context) => widget),
    (route) => false,
  );
}
