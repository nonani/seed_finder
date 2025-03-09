import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_region.freezed.dart';
part 'support_region.g.dart';

@freezed
class SupportRegion with _$SupportRegion {
  const factory SupportRegion({
    required int id,
    required String name,
  }) = _SupportRegion;


  factory SupportRegion.fromJson(Map<String, dynamic> json) => _$SupportRegionFromJson(json);

  @override
  Map<String, dynamic> toJson();

}
