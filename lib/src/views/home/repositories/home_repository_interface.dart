import 'package:hasura_connect/hasura_connect.dart';
import 'package:phonecontact/src/core/models/about_model.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';

abstract class IHomeRepository {
  Future<List<ContactModel>> getContact();
  Future<Snapshot<List<ContactModel>>> getSnapContact();
  Future<List<AboutModel>> getAbout();
  Future<List<AboutModel>> getAboutTeste();
  Future<Snapshot<List<AboutModel>>> getSnapAbout();
  Future<Snapshot<List<AboutModel>>> getSnapAbout1();
  Future<Snapshot<List<AboutModel>>> getSnapAbout2();
  Future<Snapshot<List<AboutModel>>> getSnapAbout3();
}