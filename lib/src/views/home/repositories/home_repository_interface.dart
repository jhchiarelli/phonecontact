import 'package:hasura_connect/hasura_connect.dart';
import 'package:phonecontact/src/core/models/about_model.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';

abstract class IHomeRepository {
  Future<Snapshot<List<AboutModel>>> getSnapAbout();
  Future<Snapshot<List<ContactModel>>> getSnapContact();
}