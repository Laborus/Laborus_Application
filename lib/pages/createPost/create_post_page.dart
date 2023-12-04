import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/utils/routes/global_routes.dart';
import 'package:laborus_app/utils/theme/custom/pallet_theme.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

List<String> options = ['Global', 'Campus'];

class _CreatePostPageState extends State<CreatePostPage> {
  String selectedOption = options[0];
  void _showOptionsBottomSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .3),
      builder: (BuildContext context) {
        return Container(
          color: Provider.of<PalletTheme>(context).neutral300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    color: Provider.of<PalletTheme>(context).neutral0,
                    child: ListTile(
                      tileColor: Provider.of<PalletTheme>(context).neutral0,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 7,
                      ),
                      leading: const Icon(Icons.school),
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Global'),
                          Text(
                            'O post será publicado no Feed global do App ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
                      ),
                      trailing: Radio(
                        groupValue: selectedOption,
                        value: options[0],
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Provider.of<PalletTheme>(context).neutral0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 7,
                      ),
                      leading: const Icon(Icons.school),
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Campus'),
                          Text(
                            'O post será publicado no Feed do campus',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
                      ),
                      trailing: Radio(
                        groupValue: selectedOption,
                        value: options[1],
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  GlobalRouteStack.pop();
                  String previousRoute = GlobalRouteStack.getPreviousRoute();
                  context.goNamed(previousRoute);
                },
                icon: const Icon(Icons.close),
              ),
              GestureDetector(
                onTap: () {
                  GlobalRouteStack.pop();
                  String previousRoute = GlobalRouteStack.getPreviousRoute();
                  context.goNamed(previousRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'Publicar',
                    style: TextStyle(
                      color: Provider.of<PalletTheme>(context).neutral0,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 35,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 18),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Antonía Martinez'),
                      GestureDetector(
                        onTap: _showOptionsBottomSheet,
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                          label: Text(
                            selectedOption,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          avatar: Icon(
                            Icons.circle,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Provider.of<PalletTheme>(context).neutral0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: IconButtonTheme(
          data: IconButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.code)),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
            ],
          ),
        ),
      ),
    );
  }
}
