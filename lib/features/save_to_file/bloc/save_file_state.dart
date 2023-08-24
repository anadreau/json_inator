part of 'save_file_bloc.dart';

@immutable
sealed class SaveFileState {}

final class SaveFileInitialState extends SaveFileState {}

final class SelectedFileState extends SaveFileState {}
