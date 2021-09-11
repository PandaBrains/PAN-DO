// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$isEditingAtom = Atom(name: '_ProfileViewModelBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileViewModelBase.isLoading');

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

  final _$updateProfileAsyncAction =
      AsyncAction('_ProfileViewModelBase.updateProfile');

  @override
  Future<void> updateProfile(RegisterModel model, BuildContext context) {
    return _$updateProfileAsyncAction
        .run(() => super.updateProfile(model, context));
  }

  final _$logOutAsyncAction = AsyncAction('_ProfileViewModelBase.logOut');

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$getUserInformationAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUserInformation');

  @override
  Future<void> getUserInformation() {
    return _$getUserInformationAsyncAction
        .run(() => super.getUserInformation());
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  void changeEditing() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.changeEditing');
    try {
      return super.changeEditing();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? checkEmail(dynamic email) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.checkEmail');
    try {
      return super.checkEmail(email);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? checkPass(dynamic pass) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.checkPass');
    try {
      return super.checkPass(pass);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? checkFirstSecondPass(dynamic firstPass, dynamic secondPass) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.checkFirstSecondPass');
    try {
      return super.checkFirstSecondPass(firstPass, secondPass);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? checkName(dynamic name) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.checkName');
    try {
      return super.checkName(name);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditing: ${isEditing},
isLoading: ${isLoading}
    ''';
  }
}
