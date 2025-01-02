import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
      ),
      child: Text(overview),
    );
  }
}
