<<<<<<< Updated upstream:lib/features/service/service_detail_screen.dart
import 'package:covid_fl/controllers/service_detail_controller.dart';
import 'package:covid_fl/data/models/response_model/update_response.dart';
import 'package:covid_fl/features/service/service_tile.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/app_colors.dart';
=======
import 'package:phone_tech_london/controllers/service_detail_controller.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/routes/app_routes.dart';
import 'package:phone_tech_london/utils/app_colors.dart';
>>>>>>> Stashed changes:lib/features/models/service_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:get/get.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String prodName;
  final List<ServiceList> serviceData;
  final ServiceDetailController serviceDetailController = Get.find();

  ServiceDetailScreen(
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
                    GestureDetector(
                      onTap: () {
                        serviceDetailController
                            .initialize(serviceData[index].amount);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(serviceData[index].title),
                                      IconButton(
                                          onPressed: () {
                                            serviceDetailController.clear();
                                            Get.back();
                                          },
                                          icon: Icon(Icons.clear))
                                    ],
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () async {
                                        serviceDetailController
                                            .updateService(
                                                serviceData[index].sId,
                                                serviceDetailController
                                                    .charges.text)
                                            .then((UpdateResponse value) {
                                          if (value.status == 200 &&
                                              value.message == "Success") {
                                            Get.rawSnackbar(
                                                message: value.message);
                                          } else {
                                            Get.rawSnackbar(
                                                message: "Please try again",
                                                backgroundColor: Colors.red);
                                          }
                                        });
                                        Get.offAllNamed(Routes.HOME);
                                      },
                                      child: Text("Update"),
                                      color: AppColors.lightOrange,
                                    )
                                  ],
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Service charge"),
                                      TextFormField(
                                          controller:
                                              serviceDetailController.charges,
                                          decoration: InputDecoration(
                                              prefix: Text("£"))),
                                    ],
                                  ),
                                ));
                      },
                      child: ServiceTile(
                          price: serviceData[index].amount,
                          service: serviceData[index].title),
                    ),
                  ],
                );
              })),
    );
  }
}
