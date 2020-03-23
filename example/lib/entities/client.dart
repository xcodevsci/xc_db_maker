
class Client {
  final fullname;
  final city;
  final country;
  final address;

  Client({
    this.fullname,
    this.city ,
    this.country,
    this.address
  });

  Map<String, dynamic> toMap() {

    return {
      'fullname': fullname,
      'city': city,
      'country': country,
      'address': address,
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        fullname: json['fullname'],
        city: json['city'],
        country: json['country'],
        address: json['address']
    );
  }
}