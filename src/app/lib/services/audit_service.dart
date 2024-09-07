import 'dart:convert';

import '../entities/entities.dart';
import 'base_service.dart';

class AuditService extends BaseService {
  Future<List<Audit>> getAudits() async {
    var response = await agent.getAudits();
    // var pagination = PaginationHelper.getPaginatedResponse(response);
    List<Audit> items = [];
    (jsonDecode(response.data.toString())).forEach((item) {
      items.add(Audit.fromJson(item));
    });
    // PaginatedResponse paginatedResponse =
    //     PaginatedResponse(items: items, pagination: pagination!);
    // for (Audit element in paginatedResponse.items) {
    //   print(element.toJson());
    // }
    return items;
  }
}
