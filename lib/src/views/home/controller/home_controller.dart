import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:phonecontact/src/core/models/about_model.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';
import 'package:phonecontact/src/views/home/repositories/home_repository_interface.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final IHomeRepository _repo = Get.find();

  var _loading = false.obs;
  void setLoading(bool value) => _loading.value = value;
  bool get getLoading => _loading.value;

  var _appName = "Lista de Contatos".obs;
  String get appName => _appName.value;

  RxList<AboutModel> _listAbout = RxList<AboutModel>();
  List<AboutModel> get listAbout => _listAbout;

  RxList<ContactModel> _listContact = RxList<ContactModel>();
  List<ContactModel> get listContact => _listContact;

  Snapshot<List<AboutModel>> _listSnapAbout;
  Snapshot<List<ContactModel>> _listSnapContact;

  @override
  void onInit() async {
    setLoading(true);
    await onStartControllerStream();
    setLoading(false);
    super.onInit();
  }

  @override
  void onClose() async {
    _listSnapAbout.close();
    _listSnapContact.close();
    super.onClose();
  }

  Future<void> onStartControllerStream({bool iUseLoading = false}) async {
    if (iUseLoading) {
      setLoading(true);
    }

    _listSnapAbout ??= await _repo.getSnapAbout();

    if (_listSnapAbout != null) {
      _listSnapAbout.listen((List<AboutModel> data) {
        _listAbout.value = data;
      });
    } 

    _listSnapContact ??= await _repo.getSnapContact();

    if (_listSnapContact != null) {
      _listSnapContact.listen((List<ContactModel> data) => _listContact.value = data);
    }

    if (iUseLoading) {
      setLoading(false);
    }
  }

  Future<void> onHomeRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
