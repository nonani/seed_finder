import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_detail_response.freezed.dart';

part 'document_detail_response.g.dart';

@Freezed(toJson: true)
class DocumentDetailResponse with _$DocumentDetailResponse {
  const factory DocumentDetailResponse({
    required String guideTitle,
    required String messageContent,
  }) = _DocumentDetailResponse;


  factory DocumentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DocumentDetailResponseFromJson(json);
  @override
  Map<String, dynamic> toJson();
}
