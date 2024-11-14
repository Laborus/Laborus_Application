import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/navigation/custom_app_bar_introduction.dart';
import 'package:laborus_app/core/providers/signup_provider.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/steps/details_account_step.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/steps/info_institution_step.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/steps/infos_about.dart';
import 'package:laborus_app/pages/mobile/scAuth/signup/steps/widgets/build_progress_indicator.dart';
import 'package:provider/provider.dart';

class SignupWrapper extends StatefulWidget {
  const SignupWrapper({super.key});

  @override
  State<SignupWrapper> createState() => _SignupWrapperState();
}

class _SignupWrapperState extends State<SignupWrapper> {
  late final Map<String, Widget> _dynamicWidgets;
  late final SignupProvider _signupProvider;
  int _step = 1;

  @override
  void initState() {
    super.initState();
    _dynamicWidgets = {
      'Dados Obrigatórios': DetailsAccountStep(),
      'Perfil': InfosAbout(),
      'Instituição': const InfoInstitutionStep(),
    };
    _signupProvider = Provider.of<SignupProvider>(context, listen: false);
  }

  Future<void> _handleSubmit() async {
    if (!_signupProvider.validateInstitutionStep()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, preencha todos os campos obrigatórios.')),
      );
      return;
    }

    final success = await _signupProvider.signup();
    if (success) {
      context.go(AppRouteEnum.signin.name);
    } else {
      stderr.writeln(_signupProvider.errors['submit']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_signupProvider.errors['submit'] ??
              'Falha ao criar conta. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void nextStep() {
    bool canProceed = false;

    switch (_step) {
      case 1:
        canProceed = _signupProvider.validateDetailsStep();
        break;
      case 2:
        canProceed = _signupProvider.validateProfileStep();
        break;
      case 3:
        canProceed = _signupProvider.validateInstitutionStep();
        break;
    }

    if (!canProceed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos obrigatórios.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_step < _dynamicWidgets.length) {
      setState(() {
        _step++;
      });
    } else {
      _handleSubmit();
    }
  }

  void backStep() {
    if (_step > 1) {
      setState(() {
        _step--;
      });
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: CustomAppBarIntroduction(
            title: _dynamicWidgets.keys.elementAt(_step - 1),
            onBack: backStep,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          pinned: true,
                          expandedHeight: 40,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          automaticallyImplyLeading: false,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Etapa $_step de ${_dynamicWidgets.length}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                BuildProgressIndicator(
                                  step: _step,
                                  remainingSteps:
                                      _dynamicWidgets.length - _step,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: _dynamicWidgets.values.elementAt(_step - 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (provider.isLoading)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        if (provider.loadingMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              provider.loadingMessage!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).colorScheme.primary,
            height: 140,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: provider.isLoading ? null : nextStep,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    alignment: Alignment.center,
                    child: Text(
                      _step == _dynamicWidgets.length
                          ? 'Criar Conta'
                          : 'Continuar',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRouteEnum.signin.name),
                      child: Text(
                        'Faça login!',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
