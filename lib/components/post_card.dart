import 'package:flutter/material.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 8, right: 8),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Provider.of<PalletTheme>(context).neutral100,
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
                _buildPostHeader(),
                const Divider(),
                const SizedBox(height: 10),
                _buildPostContent(),
                const SizedBox(height: 13),
                _buildPostImage(),
                const SizedBox(height: 8),
                const Divider(),
                _buildPostActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const IconButton(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/img/profile.jpg'),
              ),
              onPressed: null,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Juliana Martins',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.school, size: 8),
                    const SizedBox(width: 5),
                    Text(
                      'Fatec Carapicuiba',
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget _buildPostContent() {
    return Text(
      'Eu e meus colegas de turma estamos promovendo uma pesquisa a respeito do aquecimento global. Agradeceria muito se pudessem contribuir com a pesquisa <3',
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildPostImage() {
    return Image.asset(
      'assets/img/landscape.png',
      height: 280,
      width: double.infinity,
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton.icon(
          onPressed: null,
          icon: const Icon(Icons.thumb_up_off_alt_outlined),
          label: const Text('Curtir'),
        ),
        TextButton.icon(
          onPressed: null,
          icon: const Icon(Icons.messenger_outline_rounded),
          label: const Text('Comentar'),
        ),
      ],
    );
  }
}
