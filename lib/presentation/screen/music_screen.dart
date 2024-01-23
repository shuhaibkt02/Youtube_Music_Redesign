import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey.shade600,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey.shade800,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey.shade600,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
