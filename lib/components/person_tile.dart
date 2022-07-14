import 'package:flutter/material.dart';
import 'package:movie_app/config/api.dart';
import 'package:movie_app/models/cast.dart';

class PersonTile extends StatelessWidget {
  final Cast cast;

  const PersonTile({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: cast.profileImagePath != null
                  ? Image.network(
                      cast.profileImagePath!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;

                        final double? loadingPercent =
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null;

                        return Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.black54.withOpacity(0.3),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingPercent,
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.3),
                      ),
                    ),
            ),
            const SizedBox(height: 6),
            Text(
              cast.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              cast.character,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.color
                    ?.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
