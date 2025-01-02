import 'package:flutter/material.dart';

class PerformanceInfo extends StatelessWidget {
  const PerformanceInfo({
    super.key,
    required this.map,
  });

  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    final infoList = map.entries.toList();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "흥행정보",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 85,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: infoList.length,
              itemBuilder: (context, index) {
                final item = infoList[index];
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${item.value}'),
                      Text(item.key),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 12);
              },
            ),
          )
        ],
      ),
    );
  }
}
