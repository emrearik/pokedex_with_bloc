import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_with_bloc/data/models/pokedex_model.dart';
import 'package:pokedex_with_bloc/utils/extensions/pokemon_image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailsPage extends StatelessWidget {
  final PokedexModel pokemon;
  const DetailsPage({required this.pokemon}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: pokemon.color!.withOpacity(0.7),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_back)),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name!.english.toString(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "#" + pokemon.id.toString().padLeft(3, '0'),
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ]),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 65,
                      child: ListView.builder(
                          shrinkWrap: false,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: pokemon.type!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  pokemon.type![index],
                                  style: Theme.of(context).textTheme.headline4,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.64,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 100, 24, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: []),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 3,
              bottom: MediaQuery.of(context).size.height / 2,
              child: PokedexImage.toImage(
                  pokemon.id.toString(), pokemon.name!.english.toString(), 150),
            ),
          ],
        )
      ],
    ));
  }

  Widget pokedexFeatures(String featureName, String featurePercent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "HP",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          "45",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        LinearPercentIndicator(
          width: 250.0,
          lineHeight: 8.0,
          percent: 0.45,
          backgroundColor: Colors.grey,
          progressColor: Colors.green,
          barRadius: Radius.circular(10),
        ),
      ],
    );
  }
}
