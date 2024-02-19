import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DiscoverPage1 extends StatefulWidget {
  const DiscoverPage1({super.key});

  @override
  State<DiscoverPage1> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: bg,
            title: Text("Giriş Yap"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [


                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
