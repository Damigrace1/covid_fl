import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_tech_london/features/_widgets/text_field.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.orderId),
                          IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => Get.back())
                        ],
                      ),
                      content: Container(
                        width: 250,
                        height: 250,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.services.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(data.services[index].title),
                                          Text(
                                              "${StringConstant.GBP}${data.services[index].amount}",
                                              textAlign: TextAlign.right),
                                        ],
                                      ),
                                    )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("Total"),
                                Text(
                                    "${StringConstant.GBP}${data.totalAmount}"),
                              ],
                            ),
                            Text("Add Service"),
                            CustomTextField(
                                controller: TextEditingController(),
                                labelText: StringConstant.service_name,
                                keyboardType: TextInputType.text),
                            CustomTextField(
                                controller: TextEditingController(),
                                labelText: StringConstant.amount,
                                keyboardType: TextInputType.number),



                          ],
                        ),
                      ),
                    ));
          },
          leading: Image.network(
              "https://ebillplus.com/phonetech/public/assets/web/img/brands/google.png"),
          title: Text(data.userName),
          subtitle: GestureDetector(
              onTap: (){

              },
              child: Text("Send Invoice")),
          trailing: IconButton(
            onPressed: () {
              UrlLauncher.launch("tel://" + data.userMobile);
            },
            icon: Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
        ));
  }
}
