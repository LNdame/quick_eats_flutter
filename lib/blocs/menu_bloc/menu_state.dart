import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';


abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuEmpty extends MenuState {
 //empty state
}

class MenuLoading extends MenuState{}
class MenuLoaded extends MenuState{
  final BuiltList<Menu> menus;

  MenuLoaded({@required this.menus}):assert(menus!=null);

  @override
  List<Object> get props => [menus];
}


class MenuError extends MenuState{}