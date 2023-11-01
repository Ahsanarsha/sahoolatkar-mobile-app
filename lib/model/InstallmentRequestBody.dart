import 'dart:convert';
InstallmentRequestBody installmentRequestBodyFromJson(String str) => InstallmentRequestBody.fromJson(json.decode(str));
String installmentRequestBodyToJson(InstallmentRequestBody data) => json.encode(data.toJson());
class InstallmentRequestBody {
  InstallmentRequestBody({
      String? userId, 
      String? productId, 
      String? advance, 
      String? duration, 
      String? monthlyinstallment, 
      Applicant? applicant, 
      Granter1? granter1, 
      Granter2? granter2, 
      Declaration? declaration,}){
    _userId = userId;
    _productId = productId;
    _advance = advance;
    _duration = duration;
    _monthlyinstallment = monthlyinstallment;
    _applicant = applicant;
    _granter1 = granter1;
    _granter2 = granter2;
    _declaration = declaration;
}

  InstallmentRequestBody.fromJson(dynamic json) {
    _userId = json['user_id'];
    _productId = json['product_id'];
    _advance = json['advance'];
    _duration = json['duration'];
    _monthlyinstallment = json['monthlyinstallment'];
    _applicant = json['applicant'] != null ? Applicant.fromJson(json['applicant']) : null;
    _granter1 = json['granter1'] != null ? Granter1.fromJson(json['granter1']) : null;
    _granter2 = json['granter2'] != null ? Granter2.fromJson(json['granter2']) : null;
    _declaration = json['declaration'] != null ? Declaration.fromJson(json['declaration']) : null;
  }
  String? _userId;
  String? _productId;
  String? _advance;
  String? _duration;
  String? _monthlyinstallment;
  Applicant? _applicant;
  Granter1? _granter1;
  Granter2? _granter2;
  Declaration? _declaration;

  String? get userId => _userId;
  String? get productId => _productId;
  String? get advance => _advance;
  String? get duration => _duration;
  String? get monthlyinstallment => _monthlyinstallment;
  Applicant? get applicant => _applicant;
  Granter1? get granter1 => _granter1;
  Granter2? get granter2 => _granter2;
  Declaration? get declaration => _declaration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['advance'] = _advance;
    map['duration'] = _duration;
    map['monthlyinstallment'] = _monthlyinstallment;
    if (_applicant != null) {
      map['applicant'] = _applicant?.toJson();
    }
    if (_granter1 != null) {
      map['granter1'] = _granter1?.toJson();
    }
    if (_granter2 != null) {
      map['granter2'] = _granter2?.toJson();
    }
    if (_declaration != null) {
      map['declaration'] = _declaration?.toJson();
    }
    return map;
  }

}

Declaration declarationFromJson(String str) => Declaration.fromJson(json.decode(str));
String declarationToJson(Declaration data) => json.encode(data.toJson());
class Declaration {
  Declaration({
      String? remarks, 
      String? check, 
      String? bank, 
      String? verify, 
      String? checkCount, 
      String? mubligh, 
      String? inquiryOfficer, 
      String? inquiryOfficerSign, 
      String? crc, 
      String? crcSign, 
      String? approvelMangerA, 
      String? approvelMangerASign, 
      String? asm, 
      String? asmSign, 
      String? approvelMangerB, 
      String? approvelMangerBSign, 
      String? rsm, 
      String? rsmSign, 
      String? other, 
      String? otherSign, 
      String? crcHead, 
      String? crcHeadSign,}){
    _remarks = remarks;
    _check = check;
    _bank = bank;
    _verify = verify;
    _checkCount = checkCount;
    _mubligh = mubligh;
    _inquiryOfficer = inquiryOfficer;
    _inquiryOfficerSign = inquiryOfficerSign;
    _crc = crc;
    _crcSign = crcSign;
    _approvelMangerA = approvelMangerA;
    _approvelMangerASign = approvelMangerASign;
    _asm = asm;
    _asmSign = asmSign;
    _approvelMangerB = approvelMangerB;
    _approvelMangerBSign = approvelMangerBSign;
    _rsm = rsm;
    _rsmSign = rsmSign;
    _other = other;
    _otherSign = otherSign;
    _crcHead = crcHead;
    _crcHeadSign = crcHeadSign;
}

  Declaration.fromJson(dynamic json) {
    _remarks = json['remarks'];
    _check = json['check'];
    _bank = json['bank'];
    _verify = json['verify'];
    _checkCount = json['checkCount'];
    _mubligh = json['mubligh'];
    _inquiryOfficer = json['inquiryOfficer'];
    _inquiryOfficerSign = json['inquiryOfficerSign'];
    _crc = json['crc'];
    _crcSign = json['crcSign'];
    _approvelMangerA = json['approvelMangerA'];
    _approvelMangerASign = json['approvelMangerA_Sign'];
    _asm = json['asm'];
    _asmSign = json['asmSign'];
    _approvelMangerB = json['approvelMangerB'];
    _approvelMangerBSign = json['approvelMangerB_Sign'];
    _rsm = json['rsm'];
    _rsmSign = json['rsmSign'];
    _other = json['other'];
    _otherSign = json['otherSign'];
    _crcHead = json['crcHead'];
    _crcHeadSign = json['crcHeadSign'];
  }
  String? _remarks;
  String? _check;
  String? _bank;
  String? _verify;
  String? _checkCount;
  String? _mubligh;
  String? _inquiryOfficer;
  String? _inquiryOfficerSign;
  String? _crc;
  String? _crcSign;
  String? _approvelMangerA;
  String? _approvelMangerASign;
  String? _asm;
  String? _asmSign;
  String? _approvelMangerB;
  String? _approvelMangerBSign;
  String? _rsm;
  String? _rsmSign;
  String? _other;
  String? _otherSign;
  String? _crcHead;
  String? _crcHeadSign;

  String? get remarks => _remarks;
  String? get check => _check;
  String? get bank => _bank;
  String? get verify => _verify;
  String? get checkCount => _checkCount;
  String? get mubligh => _mubligh;
  String? get inquiryOfficer => _inquiryOfficer;
  String? get inquiryOfficerSign => _inquiryOfficerSign;
  String? get crc => _crc;
  String? get crcSign => _crcSign;
  String? get approvelMangerA => _approvelMangerA;
  String? get approvelMangerASign => _approvelMangerASign;
  String? get asm => _asm;
  String? get asmSign => _asmSign;
  String? get approvelMangerB => _approvelMangerB;
  String? get approvelMangerBSign => _approvelMangerBSign;
  String? get rsm => _rsm;
  String? get rsmSign => _rsmSign;
  String? get other => _other;
  String? get otherSign => _otherSign;
  String? get crcHead => _crcHead;
  String? get crcHeadSign => _crcHeadSign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remarks'] = _remarks;
    map['check'] = _check;
    map['bank'] = _bank;
    map['verify'] = _verify;
    map['checkCount'] = _checkCount;
    map['mubligh'] = _mubligh;
    map['inquiryOfficer'] = _inquiryOfficer;
    map['inquiryOfficerSign'] = _inquiryOfficerSign;
    map['crc'] = _crc;
    map['crcSign'] = _crcSign;
    map['approvelMangerA'] = _approvelMangerA;
    map['approvelMangerA_Sign'] = _approvelMangerASign;
    map['asm'] = _asm;
    map['asmSign'] = _asmSign;
    map['approvelMangerB'] = _approvelMangerB;
    map['approvelMangerB_Sign'] = _approvelMangerBSign;
    map['rsm'] = _rsm;
    map['rsmSign'] = _rsmSign;
    map['other'] = _other;
    map['otherSign'] = _otherSign;
    map['crcHead'] = _crcHead;
    map['crcHeadSign'] = _crcHeadSign;
    return map;
  }

}

Granter2 granter2FromJson(String str) => Granter2.fromJson(json.decode(str));
String granter2ToJson(Granter2 data) => json.encode(data.toJson());
class Granter2 {
  Granter2({
      String? name, 
      String? fatherName, 
      String? cnic, 
      String? dob, 
      String? houseAddress, 
      String? position, 
      String? duration, 
      String? relation, 
      String? mobile, 
      String? mStatus, 
      String? workAddress, 
      String? workPosition, 
      String? workDuration, 
      String? workMobile, 
      String? workMobile1, 
      String? occupation, 
      String? monthlyInstallment, 
      String? preAccount, 
      String? signature,}){
    _name = name;
    _fatherName = fatherName;
    _cnic = cnic;
    _dob = dob;
    _houseAddress = houseAddress;
    _position = position;
    _duration = duration;
    _relation = relation;
    _mobile = mobile;
    _mStatus = mStatus;
    _workAddress = workAddress;
    _workPosition = workPosition;
    _workDuration = workDuration;
    _workMobile = workMobile;
    _workMobile1 = workMobile1;
    _occupation = occupation;
    _monthlyInstallment = monthlyInstallment;
    _preAccount = preAccount;
    _signature = signature;
}

  Granter2.fromJson(dynamic json) {
    _name = json['name'];
    _fatherName = json['fatherName'];
    _cnic = json['cnic'];
    _dob = json['dob'];
    _houseAddress = json['houseAddress'];
    _position = json['position'];
    _duration = json['duration'];
    _relation = json['relation'];
    _mobile = json['mobile'];
    _mStatus = json['mStatus'];
    _workAddress = json['workAddress'];
    _workPosition = json['workPosition'];
    _workDuration = json['workDuration'];
    _workMobile = json['workMobile'];
    _workMobile1 = json['workMobile1'];
    _occupation = json['occupation'];
    _monthlyInstallment = json['monthlyInstallment'];
    _preAccount = json['preAccount'];
    _signature = json['signature'];
  }
  String? _name;
  String? _fatherName;
  String? _cnic;
  String? _dob;
  String? _houseAddress;
  String? _position;
  String? _duration;
  String? _relation;
  String? _mobile;
  String? _mStatus;
  String? _workAddress;
  String? _workPosition;
  String? _workDuration;
  String? _workMobile;
  String? _workMobile1;
  String? _occupation;
  String? _monthlyInstallment;
  String? _preAccount;
  String? _signature;

  String? get name => _name;
  String? get fatherName => _fatherName;
  String? get cnic => _cnic;
  String? get dob => _dob;
  String? get houseAddress => _houseAddress;
  String? get position => _position;
  String? get duration => _duration;
  String? get relation => _relation;
  String? get mobile => _mobile;
  String? get mStatus => _mStatus;
  String? get workAddress => _workAddress;
  String? get workPosition => _workPosition;
  String? get workDuration => _workDuration;
  String? get workMobile => _workMobile;
  String? get workMobile1 => _workMobile1;
  String? get occupation => _occupation;
  String? get monthlyInstallment => _monthlyInstallment;
  String? get preAccount => _preAccount;
  String? get signature => _signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['fatherName'] = _fatherName;
    map['cnic'] = _cnic;
    map['dob'] = _dob;
    map['houseAddress'] = _houseAddress;
    map['position'] = _position;
    map['duration'] = _duration;
    map['relation'] = _relation;
    map['mobile'] = _mobile;
    map['mStatus'] = _mStatus;
    map['workAddress'] = _workAddress;
    map['workPosition'] = _workPosition;
    map['workDuration'] = _workDuration;
    map['workMobile'] = _workMobile;
    map['workMobile1'] = _workMobile1;
    map['occupation'] = _occupation;
    map['monthlyInstallment'] = _monthlyInstallment;
    map['preAccount'] = _preAccount;
    map['signature'] = _signature;
    return map;
  }

}

Granter1 granter1FromJson(String str) => Granter1.fromJson(json.decode(str));
String granter1ToJson(Granter1 data) => json.encode(data.toJson());
class Granter1 {
  Granter1({
      String? name, 
      String? fatherName, 
      String? cnic, 
      String? dob, 
      String? houseAddress, 
      String? position, 
      String? duration, 
      String? relation, 
      String? mobile, 
      String? mStatus, 
      String? workAddress, 
      String? workPosition, 
      String? workDuration, 
      String? workMobile, 
      String? workMobile1, 
      String? occupation, 
      String? monthlyInstallment, 
      String? preAccount, 
      String? signature,}){
    _name = name;
    _fatherName = fatherName;
    _cnic = cnic;
    _dob = dob;
    _houseAddress = houseAddress;
    _position = position;
    _duration = duration;
    _relation = relation;
    _mobile = mobile;
    _mStatus = mStatus;
    _workAddress = workAddress;
    _workPosition = workPosition;
    _workDuration = workDuration;
    _workMobile = workMobile;
    _workMobile1 = workMobile1;
    _occupation = occupation;
    _monthlyInstallment = monthlyInstallment;
    _preAccount = preAccount;
    _signature = signature;
}

  Granter1.fromJson(dynamic json) {
    _name = json['name'];
    _fatherName = json['fatherName'];
    _cnic = json['cnic'];
    _dob = json['dob'];
    _houseAddress = json['houseAddress'];
    _position = json['position'];
    _duration = json['duration'];
    _relation = json['relation'];
    _mobile = json['mobile'];
    _mStatus = json['mStatus'];
    _workAddress = json['workAddress'];
    _workPosition = json['workPosition'];
    _workDuration = json['workDuration'];
    _workMobile = json['workMobile'];
    _workMobile1 = json['workMobile1'];
    _occupation = json['occupation'];
    _monthlyInstallment = json['monthlyInstallment'];
    _preAccount = json['preAccount'];
    _signature = json['signature'];
  }
  String? _name;
  String? _fatherName;
  String? _cnic;
  String? _dob;
  String? _houseAddress;
  String? _position;
  String? _duration;
  String? _relation;
  String? _mobile;
  String? _mStatus;
  String? _workAddress;
  String? _workPosition;
  String? _workDuration;
  String? _workMobile;
  String? _workMobile1;
  String? _occupation;
  String? _monthlyInstallment;
  String? _preAccount;
  String? _signature;

  String? get name => _name;
  String? get fatherName => _fatherName;
  String? get cnic => _cnic;
  String? get dob => _dob;
  String? get houseAddress => _houseAddress;
  String? get position => _position;
  String? get duration => _duration;
  String? get relation => _relation;
  String? get mobile => _mobile;
  String? get mStatus => _mStatus;
  String? get workAddress => _workAddress;
  String? get workPosition => _workPosition;
  String? get workDuration => _workDuration;
  String? get workMobile => _workMobile;
  String? get workMobile1 => _workMobile1;
  String? get occupation => _occupation;
  String? get monthlyInstallment => _monthlyInstallment;
  String? get preAccount => _preAccount;
  String? get signature => _signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['fatherName'] = _fatherName;
    map['cnic'] = _cnic;
    map['dob'] = _dob;
    map['houseAddress'] = _houseAddress;
    map['position'] = _position;
    map['duration'] = _duration;
    map['relation'] = _relation;
    map['mobile'] = _mobile;
    map['mStatus'] = _mStatus;
    map['workAddress'] = _workAddress;
    map['workPosition'] = _workPosition;
    map['workDuration'] = _workDuration;
    map['workMobile'] = _workMobile;
    map['workMobile1'] = _workMobile1;
    map['occupation'] = _occupation;
    map['monthlyInstallment'] = _monthlyInstallment;
    map['preAccount'] = _preAccount;
    map['signature'] = _signature;
    return map;
  }

}

Applicant applicantFromJson(String str) => Applicant.fromJson(json.decode(str));
String applicantToJson(Applicant data) => json.encode(data.toJson());
class Applicant {
  Applicant({
      String? name, 
      String? fatherName, 
      String? cnic, 
      String? dob, 
      String? pAddress, 
      String? cAddress, 
      String? position, 
      String? duration, 
      String? mobile, 
      String? mStatus, 
      String? preOfficeAddress, 
      String? currOfficeAddress, 
      String? businesPosition, 
      String? businesDuration, 
      String? businesMobile, 
      String? occupation, 
      String? monthlyIncome, 
      String? fine, 
      String? isBuy, 
      String? prodName, 
      String? oraganiztion, 
      String? rentalPrroductName, 
      String? modelNO, 
      String? srNO, 
      String? firstInstallment, 
      String? sellingPrice, 
      String? monthlyInstallment, 
      String? pendingAmount, 
      String? signature,}){
    _name = name;
    _fatherName = fatherName;
    _cnic = cnic;
    _dob = dob;
    _pAddress = pAddress;
    _cAddress = cAddress;
    _position = position;
    _duration = duration;
    _mobile = mobile;
    _mStatus = mStatus;
    _preOfficeAddress = preOfficeAddress;
    _currOfficeAddress = currOfficeAddress;
    _businesPosition = businesPosition;
    _businesDuration = businesDuration;
    _businesMobile = businesMobile;
    _occupation = occupation;
    _monthlyIncome = monthlyIncome;
    _fine = fine;
    _isBuy = isBuy;
    _prodName = prodName;
    _oraganiztion = oraganiztion;
    _rentalPrroductName = rentalPrroductName;
    _modelNO = modelNO;
    _srNO = srNO;
    _firstInstallment = firstInstallment;
    _sellingPrice = sellingPrice;
    _monthlyInstallment = monthlyInstallment;
    _pendingAmount = pendingAmount;
    _signature = signature;
}

  Applicant.fromJson(dynamic json) {
    _name = json['name'];
    _fatherName = json['fatherName'];
    _cnic = json['cnic'];
    _dob = json['dob'];
    _pAddress = json['pAddress'];
    _cAddress = json['cAddress'];
    _position = json['position'];
    _duration = json['duration'];
    _mobile = json['mobile'];
    _mStatus = json['mStatus'];
    _preOfficeAddress = json['preOfficeAddress'];
    _currOfficeAddress = json['currOfficeAddress'];
    _businesPosition = json['businesPosition'];
    _businesDuration = json['businesDuration'];
    _businesMobile = json['businesMobile'];
    _occupation = json['occupation'];
    _monthlyIncome = json['monthlyIncome'];
    _fine = json['fine'];
    _isBuy = json['isBuy'];
    _prodName = json['prodName'];
    _oraganiztion = json['oraganiztion'];
    _rentalPrroductName = json['rentalPrroductName'];
    _modelNO = json['modelNO'];
    _srNO = json['srNO'];
    _firstInstallment = json['firstInstallment'];
    _sellingPrice = json['sellingPrice'];
    _monthlyInstallment = json['monthlyInstallment'];
    _pendingAmount = json['pendingAmount'];
    _signature = json['signature'];
  }
  String? _name;
  String? _fatherName;
  String? _cnic;
  String? _dob;
  String? _pAddress;
  String? _cAddress;
  String? _position;
  String? _duration;
  String? _mobile;
  String? _mStatus;
  String? _preOfficeAddress;
  String? _currOfficeAddress;
  String? _businesPosition;
  String? _businesDuration;
  String? _businesMobile;
  String? _occupation;
  String? _monthlyIncome;
  String? _fine;
  String? _isBuy;
  String? _prodName;
  String? _oraganiztion;
  String? _rentalPrroductName;
  String? _modelNO;
  String? _srNO;
  String? _firstInstallment;
  String? _sellingPrice;
  String? _monthlyInstallment;
  String? _pendingAmount;
  String? _signature;

  String? get name => _name;
  String? get fatherName => _fatherName;
  String? get cnic => _cnic;
  String? get dob => _dob;
  String? get pAddress => _pAddress;
  String? get cAddress => _cAddress;
  String? get position => _position;
  String? get duration => _duration;
  String? get mobile => _mobile;
  String? get mStatus => _mStatus;
  String? get preOfficeAddress => _preOfficeAddress;
  String? get currOfficeAddress => _currOfficeAddress;
  String? get businesPosition => _businesPosition;
  String? get businesDuration => _businesDuration;
  String? get businesMobile => _businesMobile;
  String? get occupation => _occupation;
  String? get monthlyIncome => _monthlyIncome;
  String? get fine => _fine;
  String? get isBuy => _isBuy;
  String? get prodName => _prodName;
  String? get oraganiztion => _oraganiztion;
  String? get rentalPrroductName => _rentalPrroductName;
  String? get modelNO => _modelNO;
  String? get srNO => _srNO;
  String? get firstInstallment => _firstInstallment;
  String? get sellingPrice => _sellingPrice;
  String? get monthlyInstallment => _monthlyInstallment;
  String? get pendingAmount => _pendingAmount;
  String? get signature => _signature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['fatherName'] = _fatherName;
    map['cnic'] = _cnic;
    map['dob'] = _dob;
    map['pAddress'] = _pAddress;
    map['cAddress'] = _cAddress;
    map['position'] = _position;
    map['duration'] = _duration;
    map['mobile'] = _mobile;
    map['mStatus'] = _mStatus;
    map['preOfficeAddress'] = _preOfficeAddress;
    map['currOfficeAddress'] = _currOfficeAddress;
    map['businesPosition'] = _businesPosition;
    map['businesDuration'] = _businesDuration;
    map['businesMobile'] = _businesMobile;
    map['occupation'] = _occupation;
    map['monthlyIncome'] = _monthlyIncome;
    map['fine'] = _fine;
    map['isBuy'] = _isBuy;
    map['prodName'] = _prodName;
    map['oraganiztion'] = _oraganiztion;
    map['rentalPrroductName'] = _rentalPrroductName;
    map['modelNO'] = _modelNO;
    map['srNO'] = _srNO;
    map['firstInstallment'] = _firstInstallment;
    map['sellingPrice'] = _sellingPrice;
    map['monthlyInstallment'] = _monthlyInstallment;
    map['pendingAmount'] = _pendingAmount;
    map['signature'] = _signature;
    return map;
  }

}