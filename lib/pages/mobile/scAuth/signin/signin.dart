import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SiginSucess extends StatelessWidget {
  const SiginSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 200,
        leading: Row(
          children: [
            const SizedBox(width: 22),
            IconButton.outlined(
              padding: const EdgeInsets.all(14),
              iconSize: 20,
              style: ButtonStyle(
                alignment: Alignment.center,
                side: WidgetStatePropertyAll(
                  BorderSide(
                      color: Theme.of(context).colorScheme.tertiary, width: 2),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                context.goNamed('signup');
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            )
          ],
        ),
        leadingWidth: double.infinity,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Image.asset('assets/img/Successmark.png'),
            const SizedBox(height: 40),
            const Text('E-mail verificado!'),
            const SizedBox(height: 14),
            const Text(
              'Seu e-mail foi verificado com sucesso! Clique abaixo para realizar o Login.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.goNamed('signup');
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text('Ir Para Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
