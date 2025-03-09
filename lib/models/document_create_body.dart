import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_create_body.freezed.dart';
part 'document_create_body.g.dart';


@Freezed(toJson: true)
class DocumentCreateBody with _$DocumentCreateBody {
  const factory DocumentCreateBody({
    required String title,
    required String message,
    required String deviceToken,
    required String numberingId,
  }) = _DocumentCreateBody;

  @override
  Map<String, dynamic> toJson();
}
