import 'package:covid_fl/controllers/home_controller.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:covid_fl/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_list_controller.dart';
import '../utils/app_colors.dart';

class BrandListView extends StatelessWidget {
  final List<BrandModel> data;
  const BrandListView({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BrandListWidget(
                    brandName: data[index].name,
                    remarks: data[index].remarks,
                  ),
                );
              }),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Add new Brand")),
      ],
    );
  }
}

class BrandListWidget extends StatelessWidget {
  final ProductListController controller = Get.put(ProductListController());
  final String brandName, remarks;
  BrandListWidget({
    Key key,
    this.brandName,
    this.remarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListWidget(
                      data: controller.productData,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightOrange,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  brandName,
                  style: StyleManager.bold(color: AppColors.unselectedTab),
                ),
                IconButton(
                  onPressed: () => Get.defaultDialog(
                      title: brandName,
                      content: EditBrandDialog(),
                      barrierDismissible: false),
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.lightOrange,
                    size: 20,
                  ),
                )
              ],
            ),
            Text(
              remarks,
              style: StyleManager.regularBlack(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class EditBrandDialog extends StatelessWidget {
  const EditBrandDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Brand Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Remarks"),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
