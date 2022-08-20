
class DeleteAddressRequest {

  int? AddressId;


  DeleteAddressRequest({
    required this.AddressId,


  });

  Map<String, dynamic> toJson() {
    return {
      'AddressId': AddressId,

    };
  }

}