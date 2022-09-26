// ignore_for_file: implicit_dynamic_list_literal
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagenated_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class PagenatedResponse<T> with _$PagenatedResponse<T> {
  const factory PagenatedResponse({
    @Default([]) List<T> results,
    @Default(false) bool hasNext,
  }) = _PagenatedResponse<T>;
}
