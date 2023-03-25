import 'package:flutter/material.dart';
import 'package:quiz_prak_tpm_1/data/disease_data.dart';
import 'package:quiz_prak_tpm_1/pages/detailspage.dart';

List<Diseases> diseases = listDisease;

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Diseases'),
      ),
      body: GridView.builder(
        itemCount: listDisease.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          final disease = listDisease[index];
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detailspage(index: index)),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.network(
                          disease.imgUrls,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        disease.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
