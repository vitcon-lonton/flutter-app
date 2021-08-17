import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
class AsyncStatus with _$AsyncStatus {
  const factory AsyncStatus.busy() = _Busy;
  const factory AsyncStatus.complete() = _Complete;
  const factory AsyncStatus.failed() = _Failed;
  const factory AsyncStatus.idle() = _Idle;
}
