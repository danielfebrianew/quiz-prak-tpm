import 'package:flutter/material.dart';
import '../data/disease_data.dart';

List<Diseases> diseases = listDisease;
final disease = listDisease;

class UrlSearch extends StatefulWidget {
  const UrlSearch({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<UrlSearch> createState() => _UrlSearchState();
}

class _UrlSearchState extends State<UrlSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Center(
        child: Image.network(
          disease[widget.index].imgUrls,
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
