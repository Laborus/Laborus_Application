import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laborus_app/core/components/chips/profile_tag.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';
import 'package:laborus_app/core/components/generics/text_app.dart';
import 'package:laborus_app/core/providers/signup_provider.dart';
import 'package:laborus_app/core/utils/constants/tags.dart';
import 'package:provider/provider.dart';

class InfosAbout extends StatefulWidget {
  @override
  _InfosAboutState createState() => _InfosAboutState();
}

class _InfosAboutState extends State<InfosAbout> {
  final ImagePicker _picker = ImagePicker();
  XFile? _bannerImage;
  XFile? _profileImage;

  final List<Map<String, dynamic>> _tags = [];
  final TextEditingController _aboutController = TextEditingController();

  // Função de validação para o campo "Sobre"
  String? _validateAbout(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo "Sobre" é obrigatório';
    }
    // Expressão regular para permitir apenas letras, números e espaços
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Caracteres especiais não são permitidos';
    }
    return null;
  }

  Future<void> _pickImage(bool isBanner) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        if (isBanner) {
          _bannerImage = pickedFile;
        } else {
          _profileImage = pickedFile;
        }
      }
    });
  }

  void _showTagSelectionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, scrollController) {
            return ListView.builder(
              controller: scrollController,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                String tagKey = tags.keys.elementAt(index);
                String tagLabel = tags[tagKey]!['label'];
                IconData tagIcon = tags[tagKey]!['icon'];
                Color tagColor = tags[tagKey]!['color'];
                return ListTile(
                  leading: Icon(tagIcon),
                  title: Text(tagLabel),
                  onTap: () {
                    setState(() {
                      if (_tags.length < 3 &&
                          !_tags.any((tag) => tag['key'] == tagKey)) {
                        _tags.add({
                          'key': tagKey,
                          'label': tagLabel,
                          'icon': tagIcon,
                          'color': tagColor,
                        });
                      } else if (_tags.length >= 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Você só pode selecionar até 3 tags.'),
                          ),
                        );
                      }
                    });
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () => _pickImage(true),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.tertiary,
                  image: _bannerImage != null
                      ? DecorationImage(
                          image: FileImage(File(_bannerImage!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _bannerImage == null
                    ? Center(
                        child: TextApp(
                          label: 'Selecione uma imagem de capa',
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : null,
              ),
            ),
            Positioned(
              bottom: -50,
              child: GestureDetector(
                onTap: () => _pickImage(false),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.tertiary,
                    border: Border.all(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Theme.of(context).colorScheme.primary,
                        width: 10,
                        style: BorderStyle.solid),
                    image: _profileImage != null
                        ? DecorationImage(
                            image: FileImage(File(_profileImage!.path)),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/img/pessoa.png'),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60),
        CustomTextField(
          labelText: 'Sobre',
          hintText: 'Conte mais sobre você',
          onChanged: provider.setAboutContent,
          initialValue: provider.aboutContent,
          maxLines: 5,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(
                    label: 'Tags',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _showTagSelectionModal,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: provider.tags.map((tag) {
                  final tagData = tags[tag];
                  return ProfileTag(
                    label: tagData?['label'] ?? '',
                    iconData: tagData?['icon'],
                    backgroundColor: tagData?['color'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
