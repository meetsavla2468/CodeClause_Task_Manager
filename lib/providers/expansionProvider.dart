import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'expansionProvider.g.dart';

@riverpod
class expansionState extends _$expansionState{
  @override
  bool build(){
    return false;
  }
  void setStart(bool newState){
    state = newState;
  }
}

@riverpod
class expansionState0 extends _$expansionState0{
  @override
  bool build(){
    return false;
  }
  void setStart(bool newState){
    state = newState;
  }
}