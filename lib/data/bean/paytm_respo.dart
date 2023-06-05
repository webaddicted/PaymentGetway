/// BANKNAME : "Axis Bank"
/// BANKTXNID : "12433833439"
/// CHECKSUMHASH : "MtKBshhpdksqseuw7Ao+0zuPob3/OERTXBxVAbsppGwtQQnjgEOU8sn6wHvJQy1a7xa5ZXY9eMnRiVXoZM7vPKeSjg4KurvKEUzWLZyp/Bk="
/// CURRENCY : "INR"
/// GATEWAYNAME : "AXIS"
/// MID : "FnAoux43246182437237"
/// ORDERID : "1625142004918"
/// PAYMENTMODE : "NB"
/// RESPCODE : "01"
/// RESPMSG : "Txn Success"
/// STATUS : "TXN_SUCCESS"
/// TXNAMOUNT : "30.00"
/// TXNDATE : "2021-07-01 17:50:06.0"
/// TXNID : "20210701111212800110168898202777911"
/// error : "error"
/// errorMsg : "errorMsg"

class PaytmRespo {
  String? bankname;
  String? banktxnid;
  String? checksumhash;
  String? currency;
  String? gatewayname;
  String? mid;
  String? orderid;
  String? paymentmode;
  String? respcode;
  String? respmsg;
  String? status;
  String? txnamount;
  String? txndate;
  String? txnid;
  String? error;
  String? errorMsg;

  PaytmRespo({
      this.bankname, 
      this.banktxnid, 
      this.checksumhash, 
      this.currency, 
      this.gatewayname, 
      this.mid, 
      this.orderid, 
      this.paymentmode, 
      this.respcode, 
      this.respmsg, 
      this.status, 
      this.txnamount, 
      this.txndate, 
      this.txnid, 
      this.error, 
      this.errorMsg});

  PaytmRespo.fromJson(dynamic json) {
    bankname = json["BANKNAME"];
    banktxnid = json["BANKTXNID"];
    checksumhash = json["CHECKSUMHASH"];
    currency = json["CURRENCY"];
    gatewayname = json["GATEWAYNAME"];
    mid = json["MID"];
    orderid = json["ORDERID"];
    paymentmode = json["PAYMENTMODE"];
    respcode = json["RESPCODE"];
    respmsg = json["RESPMSG"];
    status = json["STATUS"];
    txnamount = json["TXNAMOUNT"];
    txndate = json["TXNDATE"];
    txnid = json["TXNID"];
    error = json["error"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["BANKNAME"] = bankname;
    map["BANKTXNID"] = banktxnid;
    map["CHECKSUMHASH"] = checksumhash;
    map["CURRENCY"] = currency;
    map["GATEWAYNAME"] = gatewayname;
    map["MID"] = mid;
    map["ORDERID"] = orderid;
    map["PAYMENTMODE"] = paymentmode;
    map["RESPCODE"] = respcode;
    map["RESPMSG"] = respmsg;
    map["STATUS"] = status;
    map["TXNAMOUNT"] = txnamount;
    map["TXNDATE"] = txndate;
    map["TXNID"] = txnid;
    map["error"] = error;
    map["errorMsg"] = errorMsg;
    return map;
  }

}