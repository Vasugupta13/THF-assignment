import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  const ResponsiveLayout({super.key, required this.mobile, required this.tablet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if((constraints.maxWidth < 500 && constraints.maxHeight < 900) ||(constraints.maxHeight < 500 && constraints.maxWidth < 900) )
      {
        return mobile;
      }
      else
      {
        return tablet;
      }
    });
  }
}
