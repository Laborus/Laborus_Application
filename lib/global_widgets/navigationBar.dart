import 'package:flutter/material.dart';
import 'package:laborus_app/utils/routes.dart';

BottomAppBar navigation(ctx) {
  return BottomAppBar(
    height: 80,
    shape: const CircularNotchedRectangle(),
    color: const Color.fromRGBO(30, 30, 30, 1),
    child: IconTheme(
      data: const IconThemeData(
        color: Color.fromRGBO(30, 30, 30, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pushNamed(AppRoutes.home);
              },
              child: const Column(
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(height: 2),
                  Text('Home',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Column(
                children: [
                  Icon(Icons.work, color: Colors.white),
                  SizedBox(height: 2),
                  Text('Vagas',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pushNamed(AppRoutes.messages);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  SizedBox(height: 2),
                  Text('Mensagens',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pushNamed(AppRoutes.config);
              },
              child: const Column(
                children: [
                  Icon(Icons.settings, color: Colors.white),
                  SizedBox(height: 2),
                  Text(
                    'Config',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
