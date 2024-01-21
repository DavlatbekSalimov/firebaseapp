import 'package:appfirebase/widgets/mytext.dart';
import 'package:flutter/material.dart';

class Keraksiz extends StatefulWidget {
  const Keraksiz({super.key});

  @override
  State<Keraksiz> createState() => _KeraksizState();
}

class _KeraksizState extends State<Keraksiz> {
  bool ischachsk = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          text: 'FireBase',
          fontSize: 25,
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: MyText(
              text: 'Hello',
              fontSize: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (ischachsk) {
                  ischachsk = false;
                } else {
                  ischachsk = true;
                }
              });
            },
            icon: ischachsk ? const Icon(Icons.add) : const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
