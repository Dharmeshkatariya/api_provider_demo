import 'package:get/get.dart';

import '../utils/export.dart';
import 'net_connectivity.dart';

class ApiProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetXNetworkManager>(GetXNetworkManager(), permanent: true);
  }
}
