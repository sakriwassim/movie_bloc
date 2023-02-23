import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../data/models/characters.dart';
import 'character_item.dart';

class CharactersListwidget extends StatelessWidget {
  List<Character>? allCharacters;
  CharactersListwidget({required this.allCharacters, super.key});

  @override
  Widget build(BuildContext context) {
    allCharacters?.sort((a, b) => a.metascore!.compareTo(b.metascore!));
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: allCharacters?.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: CharacterItem(
                character: allCharacters![index],
              ));
        });
  }
}
