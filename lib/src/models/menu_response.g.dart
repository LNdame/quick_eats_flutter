// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuResponse> _$menuResponseSerializer =
    new _$MenuResponseSerializer();

class _$MenuResponseSerializer implements StructuredSerializer<MenuResponse> {
  @override
  final Iterable<Type> types = const [MenuResponse, _$MenuResponse];
  @override
  final String wireName = 'MenuResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, MenuResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.menu_items != null) {
      result
        ..add('menus')
        ..add(serializers.serialize(object.menu_items,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Menu)])));
    }
    return result;
  }

  @override
  MenuResponse deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'menus':
          result.menu_items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Menu)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuResponse extends MenuResponse {
  @override
  final BuiltList<Menu> menu_items;

  factory _$MenuResponse([void Function(MenuResponseBuilder) updates]) =>
      (new MenuResponseBuilder()..update(updates)).build();

  _$MenuResponse._({this.menu_items}) : super._();

  @override
  MenuResponse rebuild(void Function(MenuResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuResponseBuilder toBuilder() => new MenuResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuResponse && menu_items == other.menu_items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, menu_items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuResponse')
          ..add('menu_items', menu_items))
        .toString();
  }
}

class MenuResponseBuilder
    implements Builder<MenuResponse, MenuResponseBuilder> {
  _$MenuResponse _$v;

  ListBuilder<Menu> _menu_items;
  ListBuilder<Menu> get menu_items =>
      _$this._menu_items ??= new ListBuilder<Menu>();
  set menu_items(ListBuilder<Menu> menu_items) =>
      _$this._menu_items = menu_items;

  MenuResponseBuilder();

  MenuResponseBuilder get _$this {
    if (_$v != null) {
      _menu_items = _$v.menu_items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuResponse;
  }

  @override
  void update(void Function(MenuResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuResponse build() {
    _$MenuResponse _$result;
    try {
      _$result = _$v ?? new _$MenuResponse._(menu_items: _menu_items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menu_items';
        _menu_items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
