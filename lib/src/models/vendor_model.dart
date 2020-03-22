import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'vendor_model.g.dart';

abstract class Vendor implements Built<Vendor, VendorBuilder>{
  @nullable
  String get id;
  @nullable
   String get name;
  @nullable
  String get category_id;
  @nullable
  String get contact_person_name;
  @nullable
  String get contact_person_surname;
  @nullable
  String get contact_person_contact_number;

  Vendor._();

  factory Vendor([updates(VendorBuilder b)]) = _$Vendor;

  static Serializer<Vendor> get serializer => _$vendorSerializer;

}