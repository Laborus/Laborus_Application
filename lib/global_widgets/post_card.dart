import 'package:flutter/material.dart';
import '../utils/constants.dart';
// Widget post(Color color) {
//   return 
// }
 Padding post(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 13, left: 8, right: 8),
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Theme.of(context).colorScheme.surface,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 13,
                bottom: 13,
                right: 21,
                left: 21,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const IconButton(
                            icon: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage('assets/img/profile.jpg')),
                            onPressed: null,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Juliana Martins',
                                style: font().bodyMedium,
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  const Icon(Icons.school, size: 8),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Fatec Carapicuiba',
                                    style: font().bodySmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.more_horiz)),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(
                    'Eu e meus colegas de turma estamos promovendo uma pesquisa a respeito do aquecimento global. Agradeceria muito se pudessem contribuir com a pesquisa <3',
                    style: font().bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 13),
                  Image.asset(
                    'assets/img/landscape.png',
                    height: 280,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.thumb_up_off_alt_outlined),
                        label: const Text('Curtir'),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: const Icon(
                          Icons.messenger_outline_rounded,
                        ),
                        label: const Text('Comentar'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }