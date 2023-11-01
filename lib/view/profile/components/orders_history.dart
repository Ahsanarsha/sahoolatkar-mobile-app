import 'package:flutter/material.dart';
import 'package:saholatkar/controller/OrdersHistory/orders_history_controller.dart';
import 'package:saholatkar/model/OrdersHistory/orders_history_data_model.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class OrdersHistory extends StatelessWidget {
  const OrdersHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "Orders History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return FutureBuilder(
      future: OrdersHistoryController().getOrdersHistory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<OrdersData> orders = snapshot.data as List<OrdersData>;
          return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12.0),
                  child: ListTile(
                      title: Text(
                        'Order# ${orders[index].id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text('PKR ${orders[index].totalAmount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              'Status : ${orders[index].status}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 6.0),
                              shrinkWrap: true,
                              itemCount: orders[index].products!.length,
                              itemBuilder: (context, position) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('• ${orders[index]
                                      .products![position]
                                      .name
                                      .toString()}',style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),),
                                );
                              })
                        ],
                      )),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
