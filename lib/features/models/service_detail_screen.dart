import 'package:covid_fl/controllers/service_detail_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:get/get.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String prodName;
  final List<ServiceList> serviceData;

  const ServiceDetailScreen(
      {Key? key, required this.prodName, required this.serviceData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prodName),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: serviceData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ServiceTile(
                        price: serviceData[index].amount,
                        service: serviceData[index].title),
                  ],
                );
              })),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String service, price;
  final ServiceDetailController serviceDetailController = Get.find();

  ServiceTile({Key? key, required this.service, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Update Service"),
                actions: [
                  MaterialButton(
                    onPressed: () {},
                    child: Text("Update"),
                    color: AppColors.lightOrange,
                  )
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: serviceDetailController.serviceName,
                      decoration: InputDecoration(label: Text("Service")),
                    ),
                    TextFormField(
                      controller: serviceDetailController.charges,
                      decoration: InputDecoration(label: Text("Charge")),
                    ),
                  ],
                ),
              )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.lightOrange,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(service),
            Text("£$price"),
          ],
        ),
      ),
    );
  }
}