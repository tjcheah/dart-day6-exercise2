import 'package:flutter_bloc/flutter_bloc.dart';

class FormatCubit extends Cubit<String> {
  FormatCubit() : super("No input");

  void capitalize(String input) {
    emit((state.replaceAll(state, input)).toUpperCase());
  }
}
