import 'package:hasura_connect/hasura_connect.dart';
import 'package:phonecontact/src/core/documents/about_document.dart';
import 'package:phonecontact/src/core/documents/contact_document.dart';
import 'package:phonecontact/src/core/models/about_model.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';
import 'package:phonecontact/src/core/services/hasura/hasura_service.dart';
import 'package:phonecontact/src/views/home/repositories/home_repository_interface.dart';

class HomeHasuraRepository implements IHomeRepository {
  
  @override
  Future<Snapshot<List<AboutModel>>> getSnapAbout() async {
     try {
		Snapshot snapshot = await HasuraService()
          .hasuraConnect
          .subscription(subAbout);
          return snapshot.map((item) =>  (item['data']['table_about'] as List).map((e) => AboutModel.fromMap(e)).toList());
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<Snapshot<List<ContactModel>>> getSnapContact() async {
     try {
      return await HasuraService()
          .hasuraConnect
          .subscription(subContact)
          .then((value) => (value.map((item) =>
              (item['data']['table_contacts'] as List)
                  .map((e) => ContactModel.fromMap(e))
                  .toList())))
          .timeout(Duration(seconds: 10), onTimeout: () async {
        return null;
      });
    } on HasuraError catch (e) {
      print('Error getSnapContact => $e');
      return null;
    }
  }

}
