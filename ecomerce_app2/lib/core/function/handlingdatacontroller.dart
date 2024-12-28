import 'package:ecomerce_app2/core/class/status_request.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
