import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seed_finder/models/survey_options/survey/survey_form_data.dart';
import 'package:seed_finder/models/survey_options/survey/survey_options.dart';
import 'package:seed_finder/providers/app_router_provider.dart';
import 'package:seed_finder/providers/survey_form_provider.dart';
import 'package:seed_finder/providers/survey_options_provider.dart';

class SurveyPage extends ConsumerWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surveyOptionsAsync = ref.watch(getOptionsProvider);

    return Scaffold(
      body: surveyOptionsAsync.when(
        data: (surveyOptions) => _buildSurveyForm(ref, surveyOptions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            const Center(child: Text('Failed to load survey options')),
      ),
    );
  }

  Widget _buildSurveyForm(WidgetRef ref, SurveyOptions surveyOptions) {
    final surveyForm = ref.watch(surveyFormProvider);
    final surveyNotifier = ref.read(surveyFormProvider.notifier);

    return Stepper(
      currentStep: surveyForm.id,
      onStepContinue: () {
        if (surveyForm.id < surveyOptions.question.length - 1) {
          surveyNotifier.incrementIndex();
        } else {
          surveyNotifier.submit().then((_) {
            if (ref.context.mounted) {
              ScaffoldMessenger.of(ref.context).showSnackBar(
                const SnackBar(content: Text('Survey submitted successfully!')),
              );
              Future.delayed(const Duration(seconds: 1), () {
                ref.read(goRouterProvider).go('/calendar');
              });
            }
          });
        }
      },
      onStepCancel: () {
        if (surveyForm.id > 0) {
          surveyNotifier.decrementIndex();
        }
      },
      onStepTapped: (index) {
        surveyNotifier.updateIndex(index);
      },
      steps: _buildSteps(ref, surveyOptions, surveyForm),
    );
  }

  List<Step> _buildSteps(
    WidgetRef ref,
    SurveyOptions surveyOptions,
    SurveyFormData surveyForm,
  ) {
    final surveyNotifier = ref.read(surveyFormProvider.notifier);

    return [
      Step(
        state: surveyForm.id <= 0 ? StepState.editing : StepState.complete,
        title: Text(surveyOptions.question[0]),
        content: _buildGrid(
          surveyOptions.businessClassification.map((e) => e.name).toList(),
          surveyForm.businessCategory,
          (selectedOptions) {
            surveyNotifier.setBusinessCategory(selectedOptions);
          },
        ),
        isActive: surveyForm.visited[0],
      ),
      Step(
        state: surveyForm.id <= 1 ? StepState.editing : StepState.complete,
        title: Text(surveyOptions.question[1]),
        content: _buildGrid(
          surveyOptions.applicationTarget.map((e) => e.name).toList(),
          surveyForm.businessApply,
          (selectedOptions) {
            surveyNotifier.setBusinessApply(selectedOptions);
          },
        ),
        isActive: surveyForm.visited[1],
      ),
      Step(
        state: surveyForm.id <= 2 ? StepState.editing : StepState.complete,
        title: Text(surveyOptions.question[2]),
        content: _buildGrid(
          surveyOptions.supportRegion.map((e) => e.name).toList(),
          surveyForm.businessRegion,
          (selectedOptions) {
            surveyNotifier.setBusinessRegion(selectedOptions);
          },
        ),
        isActive: surveyForm.visited[2],
      ),
      Step(
        state: surveyForm.id <= 3 ? StepState.editing : StepState.complete,
        title: Text(surveyOptions.question[3]),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: surveyOptions.question[3],
            ),
            onChanged: (value) {
              surveyNotifier.setBusinessExperience(int.tryParse(value) ?? 0);
            },
          ),
        ),
        isActive: surveyForm.visited[3],
      ),
      Step(
        state: surveyForm.id <= 4 ? StepState.editing : StepState.complete,
        title: Text(surveyOptions.question[4]),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: surveyOptions.question[4],
            ),
            onChanged: (value) {
              surveyNotifier.setBusinessTargetAge(int.tryParse(value) ?? 0);
            },
          ),
        ),
        isActive: surveyForm.visited[4],
      ),
    ];
  }

  Widget _buildGrid(
    List<String> options,
    List<String> selectedOptions,
    Function(List<String>) onSelectionChanged,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            final option = options[index];
            final newSelectedOptions = List<String>.from(selectedOptions);
            if (newSelectedOptions.contains(option)) {
              newSelectedOptions.remove(option);
            } else {
              newSelectedOptions.add(option);
            }
            onSelectionChanged(newSelectedOptions);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(8.0),
            color: selectedOptions.contains(options[index])
                ? Colors.blue
                : Colors.grey,
            child: Center(child: Text(options[index])),
          ),
        );
      },
    );
  }
}
