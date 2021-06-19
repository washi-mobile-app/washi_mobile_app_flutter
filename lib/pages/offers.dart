import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/entities/Offer.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ofertas"),
        ),
        body: Center(child: OffersList()));
  }
}

class OffersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListOfferWidget();
  }
}

class ListOfferWidget extends State<OffersList> {
  final List<Offer> offers = <Offer>[
    Offer(
        laundryService: 'Lavado de pantalones',
        discount: '3 x 2',
        initialDate: '28/05/21',
        endingDate: '28/06/21',
        imglink: 'lib/assets/oferta1.png'),
    Offer(
        laundryService: 'Lavado de edredones',
        discount: '50% en el 3ro',
        initialDate: '07/06/21',
        endingDate: '21/06/21',
        imglink: 'lib/assets/oferta2.png'),
    Offer(
        laundryService: 'Lavado de ternos',
        discount: '20%',
        initialDate: '13/06/21',
        endingDate: '26/06/21',
        imglink: 'lib/assets/oferta3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return new Container(
              child: Card(
                elevation: 5,
                child: InkWell(
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          new Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(offers[index].imglink)),
                          new Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(offers[index].laundryService, style: Theme.of(context).textTheme.title),
                                Text(offers[index].discount,
                                    style: TextStyle(color: Colors.black.withOpacity(0.5))),
                                Text(offers[index].initialDate),
                                Text(offers[index].endingDate),
                              ],
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )),
                ),
              ),
            );
          },
        ));
  }
}
