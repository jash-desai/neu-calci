import '/calc.home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NeumorphicApp());
}

class NeumorphicApp extends StatelessWidget {
  const NeumorphicApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Neumorphic App',
      debugShowCheckedModeBanner: false,
      home: Calculator(),
      // home: Scaffold(
      //   body: Column(
      //     children: [
      //       const SizedBox(height: 100),
      //       const Center(
      //         child: Text('Neumorphic AF'),
      //       ),
      //       const SizedBox(height: 200),
      //       const Center(
      //         child: OldContainer(
      //           child: Text('Button'),
      //         ),
      //       ),
      //       const SizedBox(height: 100),
      //       Center(
      //         child: NeumorphicButtonBinary(
      //           // useSize: false,
      //           height: 25,
      //           width: 50,
      //           bevel: 10,
      //           radius: 50,
      //           childOn: const Text(
      //             'On',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           childOff: const Text(
      //             'Off',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           color: Colors.blueGrey.shade300,
      //         ),
      //       ),
      //       const SizedBox(height: 100),
      //       Center(
      //         child: NeumorphicButtonUnary(
      //           // useSize: false,
      //           height: 25,
      //           width: 50,
      //           bevel: 10,
      //           radius: 50,
      //           child: const Text('Login'),
      //           color: Colors.blueGrey.shade300,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
