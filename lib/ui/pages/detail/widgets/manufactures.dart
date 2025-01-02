import 'package:flutter/material.dart';

class Manufactures extends StatelessWidget {
  const Manufactures({
    super.key,
    required this.productionCompanyLogos,
  });

  final List<String> productionCompanyLogos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: productionCompanyLogos.length,
          itemBuilder: (context, index) {
            final logoPath = productionCompanyLogos[index];
            return Opacity(
              opacity: 0.9,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${logoPath}',
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox.shrink();
                  },
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 12);
          },
        ),
      ),
    );
  }
}
