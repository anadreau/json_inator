part of 'save_file_bloc.dart';

@immutable
sealed class SaveFileEvent {}

final class SaveFile extends SaveFileEvent {
  late final String? chosenDir;
}

final class SelectFile extends SaveFileEvent {
  late final String? chosenDir;
}
