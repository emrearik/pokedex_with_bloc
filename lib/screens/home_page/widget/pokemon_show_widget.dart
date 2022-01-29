import 'package:flutter/material.dart';
import 'package:pokedex_with_bloc/data/models/pokedex_model.dart';
import 'package:pokedex_with_bloc/screens/details_page/details_page.dart';
import 'package:pokedex_with_bloc/utils/extensions/pokemon_image.dart';

class PokemonShow extends StatelessWidget {
  final PokedexModel pokemon;

  const PokemonShow({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _popDetailsPage(context, pokemon),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: pokemon.color,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -8,
                right: -21,
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.white.withOpacity(0.2)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 5, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name!.english.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        PokedexImage.toImage(pokemon.id.toString(),
                            pokemon.name!.english.toString(), 70),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _popDetailsPage(BuildContext context, PokedexModel pokemon) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  pokemon: pokemon,
                )));
  }
}
