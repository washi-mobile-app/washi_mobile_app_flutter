class LaundryOrder1 {
  final int userId;
  final int orderStatusId;
  final String deliveryAddress;
  final String orderAmount;
  final String date;
  final String deliveryDate;

  LaundryOrder1._({this.userId = 0,this.orderStatusId = 0,this.deliveryAddress = "",this.orderAmount = "",this.date = "",this.deliveryDate = ""});

  factory LaundryOrder1.fromJson(Map<String,dynamic>json){
      return new LaundryOrder1._(
        userId: json['userId'],
        orderStatusId: json['orderStatusId'],
        deliveryAddress: json['deliveryAddress'],
        orderAmount: json['orderAmount'],
        date: json['date'],
        deliveryDate: json['deliveryDate']
      );
  }
}