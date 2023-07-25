import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'codeProvider.g.dart';

@riverpod
class codeState extends _$codeState{
  @override
  String build(){
    return "";
  }
  void setStart(String newState){
    state = newState;
  }
}