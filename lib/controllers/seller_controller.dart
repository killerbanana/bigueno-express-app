import 'package:biguenoexpress/models/sellers.dart';
import 'package:biguenoexpress/services/remote_services.dart';
import 'package:get/state_manager.dart';

class SellerController extends GetxController {
  var isLoading = true.obs;
  var sellerList = List<Sellers>().obs;

  @override
  void onInit() {
    fetchSellers();
    super.onInit();
  }

  void fetchSellers() async {
    try {
      isLoading(true);
      var sellers = await RemoteServices.fetchSellers();
      if (sellers != null) {
        sellerList.value = sellers;
      }
    } finally {
      isLoading(false);
    }
  }
}