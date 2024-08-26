import 'package:flutter_test/flutter_test.dart';
import 'package:seed_finder/models/business_experience_range.dart';
import 'package:seed_finder/models/region.dart';
import 'package:seed_finder/models/survey.dart';
import 'dart:convert';

void main() {
  test("json serialization test", () {
    final jsonString =
    """
    {
    "businessCategory": ["IT", "Finance"],
    "businessRegion": ["gangwon", "gyeonggi"],
    "businessApply": ["online", "offline"],
    "businessExperience": 5,
    "businessTargetAge": 30
    }
    """;

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
  print(json);
    expect(
          () => Survey.fromJson(json),
      isNot(
        anyOf(
          throwsArgumentError,
          throwsA(isA<TypeError>()),
        ),
      ),
    );
  });
}