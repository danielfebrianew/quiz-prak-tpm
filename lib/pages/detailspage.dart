import 'package:flutter/material.dart';
import 'package:quiz_prak_tpm_1/data/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logging/logging.dart';

List<Diseases> diseases = listDisease;
final disease = listDisease;
final Logger logger = Logger('URL Launcher');

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    final snackBar = SnackBar(
      content: Text(
        _isFavorite ? 'Added to favorites' : 'Removed from favorites',
      ),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Diseases'),
        actions: [
          GestureDetector(
            onTap: _toggleFavorite,
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.network(
              disease[widget.index].imgUrls,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              disease[widget.index].name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Disease Name',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              disease[widget.index].name,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Plant Name',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              disease[widget.index].plantName,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Ciri-ciri',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: List<Widget>.generate(
                disease[widget.index].nutshell.length,
                (index) => Text(
                  disease[widget.index].nutshell[index],
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Disease ID',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              disease[widget.index].id,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Symptom',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "     ${disease[widget.index].symptom}",
              style: const TextStyle(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Uri query = Uri.parse(disease[widget.index].imgUrls);
          _launch(query);
        },
        tooltip: 'Open Image',
        child: const Icon(Icons.folder_open),
      ),
    );
  }

  Future<void> _launch(Uri url) async {
    String concatenate = url.origin + url.path;
    Uri finalURL = Uri.parse(concatenate);
    // print(' concatenate : $concatenate');
    try {
      if (await canLaunchUrl(finalURL)) {
        await launchUrl(finalURL);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      logger.severe('Error launching URL: $e');
    }
  }
}
