import 'package:flutter/cupertino.dart';

import '../../domain/entity/business_info.dart';

class BusinessInfoProvider with ChangeNotifier {
  int index = 0;
  BusinessInfo _businessInfo = BusinessInfo(
    type: [],
    identity: [],
    special: [],
    I_field: [],
    s_field: [],
    period: [],
    age: 0,
    sale: 0,
    invest: 0,
    region: [],
  );

  BusinessInfo get businessInfo => _businessInfo;

  void incrementIndex() {
    index++;
    notifyListeners();
  }

  void decrementIndex() {
    index--;
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void updateBusinessInfo(BusinessInfo newInfo) {
    _businessInfo = newInfo;
    notifyListeners();
  }

  void updateIdentity(List<String> newIdentity) {
    _businessInfo.identity = newIdentity;
    notifyListeners();
  }

  void updateSpecial(List<String> newSpecial) {
    _businessInfo.special = newSpecial;
    notifyListeners();
  }

  void updateIField(List<String> newIField) {
    _businessInfo.I_field = newIField;
    notifyListeners();
  }

  void updateSField(List<String> newSField) {
    _businessInfo.s_field = newSField;
    notifyListeners();
  }
  void updatePeriod(List<String> newPeriod) {
    _businessInfo.period = newPeriod;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _businessInfo.age = newAge;
    notifyListeners();
  }

  void updateSale(int newSale) {
    _businessInfo.sale = newSale;
    notifyListeners();
  }

  void updateInvest(int newInvest) {
    _businessInfo.invest = newInvest;
    notifyListeners();
  }

  void updateRegion(List<String> newRegion) {
    _businessInfo.region = newRegion;
    notifyListeners();
  }
}
