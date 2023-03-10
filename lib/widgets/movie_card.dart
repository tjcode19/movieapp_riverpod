import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../api/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: '${Constants.imageBaseUrl}$posterPath',
        ),
      ),
    );
  }
}
