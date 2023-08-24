part of 'save_file_bloc.dart';

@immutable
sealed class SaveFileEvent {}

final class SaveFile extends SaveFileEvent {}

final class SelectFile extends SaveFileEvent {}
