// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItem> _$menuItemSerializer = new _$MenuItemSerializer();

class _$MenuItemSerializer implements StructuredSerializer<MenuItem> {
  @override
  final Iterable<Type> types = const [MenuItem, _$MenuItem];
  @override
  final String wireName = 'MenuItem';

  @override
  Iterable<Object> serialize(Serializers serializers, MenuItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.item_name != null) {
      result
        ..add('item_name')
        ..add(serializers.serialize(object.item_name,
            specifiedType: const FullType(String)));
    }
    if (object.menu_id != null) {
      result
        ..add('menu_id')
        ..add(serializers.serialize(object.menu_id,
            specifiedType: const FullType(String)));
    }
    if (object.item_description != null) {
      result
        ..add('item_description')
        ..add(serializers.serialize(object.item_description,
            specifiedType: const FullType(String)));
    }
    if (object.item_picture_url != null) {
      result
        ..add('item_picture_url')
        ..add(serializers.serialize(object.item_picture_url,
            specifiedType: const FullType(String)));
    }
    if (object.item_price != null) {
      result
        ..add('item_price')
        ..add(serializers.serialize(object.item_price,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MenuItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemBuilder();

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
        case 'item_name':
          result.item_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'menu_id':
          result.menu_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'item_description':
          result.item_description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'item_picture_url':
          result.item_picture_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'item_price':
          result.item_price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItem extends MenuItem {
  @override
  final String id;
  @override
  final String item_name;
  @override
  final String menu_id;
  @override
  final String item_description;
  @override
  final String item_picture_url;
  @override
  final String item_price;

  factory _$MenuItem([void Function(MenuItemBuilder) updates]) =>
      (new MenuItemBuilder()..update(updates)).build();

  _$MenuItem._(
      {this.id,
      this.item_name,
      this.menu_id,
      this.item_description,
      this.item_picture_url,
      this.item_price})
      : super._();

  @override
  MenuItem rebuild(void Function(MenuItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemBuilder toBuilder() => new MenuItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItem &&
        id == other.id &&
        item_name == other.item_name &&
        menu_id == other.menu_id &&
        item_description == other.item_description &&
        item_picture_url == other.item_picture_url &&
        item_price == other.item_price;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), item_name.hashCode),
                    menu_id.hashCode),
                item_description.hashCode),
            item_picture_url.hashCode),
        item_price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItem')
          ..add('id', id)
          ..add('item_name', item_name)
          ..add('menu_id', menu_id)
          ..add('item_description', item_description)
          ..add('item_picture_url', item_picture_url)
          ..add('item_price', item_price))
        .toString();
  }
}

class MenuItemBuilder implements Builder<MenuItem, MenuItemBuilder> {
  _$MenuItem _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _item_name;
  String get item_name => _$this._item_name;
  set item_name(String item_name) => _$this._item_name = item_name;

  String _menu_id;
  String get menu_id => _$this._menu_id;
  set menu_id(String menu_id) => _$this._menu_id = menu_id;

  String _item_description;
  String get item_description => _$this._item_description;
  set item_description(String item_description) =>
      _$this._item_description = item_description;

  String _item_picture_url;
  String get item_picture_url => _$this._item_picture_url;
  set item_picture_url(String item_picture_url) =>
      _$this._item_picture_url = item_picture_url;

  String _item_price;
  String get item_price => _$this._item_price;
  set item_price(String item_price) => _$this._item_price = item_price;

  MenuItemBuilder();

  MenuItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _item_name = _$v.item_name;
      _menu_id = _$v.menu_id;
      _item_description = _$v.item_description;
      _item_picture_url = _$v.item_picture_url;
      _item_price = _$v.item_price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItem;
  }

  @override
  void update(void Function(MenuItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItem build() {
    final _$result = _$v ??
        new _$MenuItem._(
            id: id,
            item_name: item_name,
            menu_id: menu_id,
            item_description: item_description,
            item_picture_url: item_picture_url,
            item_price: item_price);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
