import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/core/components/navigation/custom_app_bar_introduction.dart';
import 'package:laborus_app/core/providers/signup_provider.dart';
import 'package:laborus_app/core/routes/app_route_enum.dart';
import 'package:laborus_app/core/routes/go_router_prevent_duplicate.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
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

  Future<void> _handleSubmit() async {
    final success = await _signupProvider.signup();
    if (success) {
      // Navigate to success screen or login
      context.go(AppRouteEnum.signin.name);
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup failed. Please try again.')),
      );
    }
  }

  int _step = 1;
  int _remainingSteps = 2;

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

  void nextStep() {
    if (_step < _dynamicWidgets.length) {
      setState(() {
        _step++;
        _remainingSteps--;
      });
    }
  }

  void backStep() {
    if (_step > 1) {
      setState(() {
        _step--;
        _remainingSteps++;
      });
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBarIntroduction(
        title: _dynamicWidgets.keys.elementAt(_step - 1),
        onBack: backStep,
      ),
      body: Padding(
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
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Etapa $_step de ${_remainingSteps + _step}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 8),
                        BuildProgressIndicator(
                          step: _step,
                          remainingSteps: _remainingSteps,
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
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        height: 140,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: nextStep,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                alignment: Alignment.center,
                child: const Text('Continuar'),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Possui uma conta?',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    AppRouteEnum currentPath = AppRouteEnum.signin;
                    String routePath = currentPath.name;
                    GoRouter.of(context).pushIfNotCurrent(context, routePath);
                  },
                  child: Text(
                    'Crie sua conta!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.mediumPurple,
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
  }
}
