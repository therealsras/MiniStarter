import '../entities/entities.dart';
import '../services/services.dart';
import 'base_model.dart';

class AuditModel extends BaseModel {
  List<Audit> audits = [];

  Future<List<Audit>> loadAudits() async {
    return audits.isNotEmpty
        ? audits
        : audits = await AuditService().getAudits();
  }

  Audit getAuditById(int id) {
    return audits.firstWhere((element) => element.id == id);
  }
}
