import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laborus_app/core/components/forms/text_field_form.dart';
import 'package:laborus_app/core/components/generics/text_app.dart';
import 'package:laborus_app/core/model/users/image_model.dart';
import 'package:laborus_app/core/providers/signup_provider.dart';
import 'package:provider/provider.dart';

class InfosAbout extends StatefulWidget {
  @override
  _InfosAboutState createState() => _InfosAboutState();
}

class _InfosAboutState extends State<InfosAbout> {
  final ImagePicker _picker = ImagePicker();

  String? _validateAbout(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo "Sobre" é obrigatório';
    }
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Caracteres especiais não são permitidos';
    }
    return null;
  }

  Future<void> _pickImage(BuildContext context, bool isBanner) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: isBanner ? 1920 : 800,
        maxHeight: isBanner ? 1080 : 800,
      );

      if (pickedFile != null) {
        final provider = Provider.of<SignupProvider>(context, listen: false);
        final file = File(pickedFile.path);

        // Criar o ImageModel a partir do arquivo
        final imageModel = ImageModel.fromFile(file);

        if (isBanner) {
          provider.setBannerImage(imageModel);
        } else {
          provider.setProfileImage(imageModel);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao selecionar imagem: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, provider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(context, true),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.tertiary,
                      image: provider.bannerImageFile != null
                          ? DecorationImage(
                              image: MemoryImage(
                                base64Decode(
                                    provider.bannerImageFile!.base64Data),
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: provider.bannerImageFile == null
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
                    onTap: () => _pickImage(context, false),
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
                          style: BorderStyle.solid,
                        ),
                        image: provider.profileImageFile != null
                            ? DecorationImage(
                                image: MemoryImage(
                                  base64Decode(
                                      provider.profileImageFile!.base64Data),
                                ),
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
              validator: _validateAbout,
            ),
          ],
        );
      },
    );
  }
}
