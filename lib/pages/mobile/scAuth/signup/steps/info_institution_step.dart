import 'package:flutter/material.dart';
import 'package:laborus_app/core/model/users/school_model.dart';
import 'package:laborus_app/core/providers/signup_provider.dart';
import 'package:provider/provider.dart';

class InfoInstitutionStep extends StatelessWidget {
  const InfoInstitutionStep({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Informações da Instituição',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Por favor, Precisamos de mais algumas informações para criar sua conta.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 15),
        FutureBuilder<List<SchoolModel>>(
          future: provider.getSchools(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final schools = snapshot.data!;
              return DropdownButtonFormField<String>(
                value: provider.school.isNotEmpty ? provider.school : null,
                hint: const Text('Selecione sua instituição'),
                items: schools.map((school) {
                  return DropdownMenuItem(
                    value: school.id,
                    child: Text(school.name),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    provider.setSchool(value);
                    // Reset course when school changes
                    provider.setCourse('');
                  }
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        const SizedBox(height: 15),
        if (provider.school.isNotEmpty)
          FutureBuilder<List<SchoolModel>>(
            future: provider.getSchools(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final selectedSchool = snapshot.data!
                    .firstWhere((school) => school.id == provider.school);
                return DropdownButtonFormField<String>(
                  value: provider.course.isNotEmpty ? provider.course : null,
                  hint: const Text('Selecione seu curso'),
                  items: selectedSchool.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      provider.setCourse(value);
                    }
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
      ],
    );
  }
}
