// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeViewModel on _WelcomeViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_WelcomeViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$toDoModelAtom = Atom(name: '_WelcomeViewModelBase.toDoModel');

  @override
  List<ToDoModel> get toDoModel {
    _$toDoModelAtom.reportRead();
    return super.toDoModel;
  }

  @override
  set toDoModel(List<ToDoModel> value) {
    _$toDoModelAtom.reportWrite(value, super.toDoModel, () {
      super.toDoModel = value;
    });
  }

  final _$getAllTodosAsyncAction =
      AsyncAction('_WelcomeViewModelBase.getAllTodos');

  @override
  Future<void> getAllTodos(dynamic context) {
    return _$getAllTodosAsyncAction.run(() => super.getAllTodos(context));
  }

  final _$searhToDoAsyncAction = AsyncAction('_WelcomeViewModelBase.searhToDo');

  @override
  Future<void> searhToDo(String searchText) {
    return _$searhToDoAsyncAction.run(() => super.searhToDo(searchText));
  }

  final _$_WelcomeViewModelBaseActionController =
      ActionController(name: '_WelcomeViewModelBase');

  @override
  void changeLoding() {
    final _$actionInfo = _$_WelcomeViewModelBaseActionController.startAction(
        name: '_WelcomeViewModelBase.changeLoding');
    try {
      return super.changeLoding();
    } finally {
      _$_WelcomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
toDoModel: ${toDoModel}
    ''';
  }
}
