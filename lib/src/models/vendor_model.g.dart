// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Vendor> _$vendorSerializer = new _$VendorSerializer();

class _$VendorSerializer implements StructuredSerializer<Vendor> {
  @override
  final Iterable<Type> types = const [Vendor, _$Vendor];
  @override
  final String wireName = 'Vendor';

  @override
  Iterable<Object> serialize(Serializers serializers, Vendor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.category_id != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(object.category_id,
            specifiedType: const FullType(String)));
    }
    if (object.contact_person_name != null) {
      result
        ..add('contact_person_name')
        ..add(serializers.serialize(object.contact_person_name,
            specifiedType: const FullType(String)));
    }
    if (object.contact_person_surname != null) {
      result
        ..add('contact_person_surname')
        ..add(serializers.serialize(object.contact_person_surname,
            specifiedType: const FullType(String)));
    }
    if (object.contact_person_contact_number != null) {
      result
        ..add('contact_person_contact_number')
        ..add(serializers.serialize(object.contact_person_contact_number,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Vendor deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VendorBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category_id':
          result.category_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_person_name':
          result.contact_person_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_person_surname':
          result.contact_person_surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_person_contact_number':
          result.contact_person_contact_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Vendor extends Vendor {
  @override
  final String id;
  @override
  final String name;
  @override
  final String category_id;
  @override
  final String contact_person_name;
  @override
  final String contact_person_surname;
  @override
  final String contact_person_contact_number;

  factory _$Vendor([void Function(VendorBuilder) updates]) =>
      (new VendorBuilder()..update(updates)).build();

  _$Vendor._(
      {this.id,
      this.name,
      this.category_id,
      this.contact_person_name,
      this.contact_person_surname,
      this.contact_person_contact_number})
      : super._();

  @override
  Vendor rebuild(void Function(VendorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VendorBuilder toBuilder() => new VendorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vendor &&
        id == other.id &&
        name == other.name &&
        category_id == other.category_id &&
        contact_person_name == other.contact_person_name &&
        contact_person_surname == other.contact_person_surname &&
        contact_person_contact_number == other.contact_person_contact_number;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), name.hashCode),
                    category_id.hashCode),
                contact_person_name.hashCode),
            contact_person_surname.hashCode),
        contact_person_contact_number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Vendor')
          ..add('id', id)
          ..add('name', name)
          ..add('category_id', category_id)
          ..add('contact_person_name', contact_person_name)
          ..add('contact_person_surname', contact_person_surname)
          ..add('contact_person_contact_number', contact_person_contact_number))
        .toString();
  }
}

class VendorBuilder implements Builder<Vendor, VendorBuilder> {
  _$Vendor _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _category_id;
  String get category_id => _$this._category_id;
  set category_id(String category_id) => _$this._category_id = category_id;

  String _contact_person_name;
  String get contact_person_name => _$this._contact_person_name;
  set contact_person_name(String contact_person_name) =>
      _$this._contact_person_name = contact_person_name;

  String _contact_person_surname;
  String get contact_person_surname => _$this._contact_person_surname;
  set contact_person_surname(String contact_person_surname) =>
      _$this._contact_person_surname = contact_person_surname;

  String _contact_person_contact_number;
  String get contact_person_contact_number =>
      _$this._contact_person_contact_number;
  set contact_person_contact_number(String contact_person_contact_number) =>
      _$this._contact_person_contact_number = contact_person_contact_number;

  VendorBuilder();

  VendorBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _category_id = _$v.category_id;
      _contact_person_name = _$v.contact_person_name;
      _contact_person_surname = _$v.contact_person_surname;
      _contact_person_contact_number = _$v.contact_person_contact_number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Vendor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Vendor;
  }

  @override
  void update(void Function(VendorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Vendor build() {
    final _$result = _$v ??
        new _$Vendor._(
            id: id,
            name: name,
            category_id: category_id,
            contact_person_name: contact_person_name,
            contact_person_surname: contact_person_surname,
            contact_person_contact_number: contact_person_contact_number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
