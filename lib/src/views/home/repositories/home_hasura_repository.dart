import 'package:hasura_connect/hasura_connect.dart';
import 'package:phonecontact/src/core/documents/about_document.dart';
import 'package:phonecontact/src/core/documents/contact_document.dart';
import 'package:phonecontact/src/core/models/about_model.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';
import 'package:phonecontact/src/core/services/hasura/hasura_service.dart';
import 'package:phonecontact/src/views/home/repositories/home_repository_interface.dart';

class HomeHasuraRepository implements IHomeRepository {

  @override
  Future<List<AboutModel>> getAbout() async {
    try {
      return await HasuraService()
          .hasuraConnect
          .query(queryAbout)
          .then((value) => (value['data']['table_about'] as List)
              .map((item) => AboutModel.fromMap(item))
              .toList())
          .timeout(Duration(seconds: 10), onTimeout: () async {
        return null;
      });
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<List<AboutModel>> getAboutTeste() async {
    List<AboutModel> _list;
    try {
      await HasuraService()
          .hasuraConnect
          .subscription(subAbout)
          .then((value) async => value.listen((event) async {
                print('List Event => $event');
                _list.add(event);
              }));
      // .then((value) => value.listen((event) => _list.add(event)));

      print('List => $_list');
      return null;
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<Snapshot<List<AboutModel>>> getSnapAbout() async {
    try {
		Snapshot snapshot = await HasuraService()
          .hasuraConnect
          .subscription(subAbout);

          // await Future.delayed(const Duration(seconds: 2));

          return snapshot.map((item) =>  (item['data']['table_about'] as List).map((e) => AboutModel.fromMap(e)).toList());
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<List<ContactModel>> getContact() async {
    try {
      return await HasuraService()
          .hasuraConnect
          .query(queryContact)
          .then((value) => (value['data']['table_contacts'] as List)
              .map((item) => ContactModel.fromMap(item))
              .toList())
          .timeout(Duration(seconds: 10), onTimeout: () async {
        return null;
      });
    } on HasuraError catch (e) {
      print('Error getContact => $e');
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

  //Funcoes abaixo sao testes que estava fazendo por causa do problema do subscription vir nulo
  @override
  Future<Snapshot<List<AboutModel>>> getSnapAbout1() async {
    try {
       Snapshot snapshot = await HasuraService()
          .hasuraConnect
          .subscription(subAbout);

          await Future.delayed(const Duration(seconds: 2));

          return snapshot.map((item) => (item['data']['table_about'] as List).map((e) => AboutModel.fromMap(e)).toList());

    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<Snapshot<List<AboutModel>>> getSnapAbout2() async {
    try {
          return await HasuraService()
          .hasuraConnect
              .subscription(subAbout)
              .then((value) async {
                await Future.delayed(const Duration(seconds: 2));
                return (value.map((item) => (item['data']['table_about'] as List).map((e) => AboutModel.fromMap(e)).toList()));
              })
              // .then((value) => (value.map((item) => (item['data']['table_about'] as List).map((e) => AboutModel.fromMap(e)).toList())))
              .timeout(Duration(seconds: 10), onTimeout: () async { return null; });
         
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

  @override
  Future<Snapshot<List<AboutModel>>> getSnapAbout3() async {
    try {
          return await HasuraService()
          .hasuraConnect
              .subscription(subAbout)
              .then((value) => (value.map((item) => (item['data']['table_about'] as List)
              .map((e) => AboutModel.fromMap(e))
              .toList())))
              .timeout(Duration(seconds: 10), onTimeout: () async { return null; });
    } on HasuraError catch (e) {
      print('Error getAbout => $e');
      return null;
    }
  }

}
