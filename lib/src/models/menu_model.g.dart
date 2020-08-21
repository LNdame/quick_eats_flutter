// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Menu> _$menuSerializer = new _$MenuSerializer();

class _$MenuSerializer implements StructuredSerializer<Menu> {
  @override
  final Iterable<Type> types = const [Menu, _$Menu];
  @override
  final String wireName = 'Menu';

  @override
  Iterable<Object> serialize(Serializers serializers, Menu object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.menu_name != null) {
      result
        ..add('menu_name')
        ..add(serializers.serialize(object.menu_name,
            specifiedType: const FullType(String)));
    }
    if (object.restaurant_id != null) {
      result
        ..add('restaurant_id')
        ..add(serializers.serialize(object.restaurant_id,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Menu deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'menu_name':
          result.menu_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'restaurant_id':
          result.restaurant_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Menu extends Menu {
  @override
  final String id;
  @override
  final String menu_name;
  @override
  final String restaurant_id;
  @override
  final String description;

  factory _$Menu([void Function(MenuBuilder) updates]) =>
      (new MenuBuilder()..update(updates)).build();

  _$Menu._({this.id, this.menu_name, this.restaurant_id, this.description})
      : super._();

  @override
  Menu rebuild(void Function(MenuBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuBuilder toBuilder() => new MenuBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Menu &&
        id == other.id &&
        menu_name == other.menu_name &&
        restaurant_id == other.restaurant_id &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), menu_name.hashCode),
            restaurant_id.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Menu')
          ..add('id', id)
          ..add('menu_name', menu_name)
          ..add('restaurant_id', restaurant_id)
          ..add('description', description))
        .toString();
  }
}

class MenuBuilder implements Builder<Menu, MenuBuilder> {
  _$Menu _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _menu_name;
  String get menu_name => _$this._menu_name;
  set menu_name(String menu_name) => _$this._menu_name = menu_name;

  String _restaurant_id;
  String get restaurant_id => _$this._restaurant_id;
  set restaurant_id(String restaurant_id) =>
      _$this._restaurant_id = restaurant_id;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  MenuBuilder();

  MenuBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _menu_name = _$v.menu_name;
      _restaurant_id = _$v.restaurant_id;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Menu other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Menu;
  }

  @override
  void update(void Function(MenuBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Menu build() {
    final _$result = _$v ??
        new _$Menu._(
            id: id,
            menu_name: menu_name,
            restaurant_id: restaurant_id,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
