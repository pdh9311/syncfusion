import 'package:get/get.dart';
import 'package:syncfusion_datagrid_proj/datasource/employee_datasource.dart';
import 'package:syncfusion_datagrid_proj/model/employee.dart';

class EmployeeController extends GetxController {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource = EmployeeDataSource(_employees);

  List<Employee> get employees => this._employees;
  get employeeDataSource => this._employeeDataSource;

  void add() {
    final employee = Employee(1, 'donpark', 'dev', 100);
    _employeeDataSource.employees.add(employee);
    _employeeDataSource.updateDataGridRows();
    _employeeDataSource.updateDataGridSource();
    print("[add] employees.length : ${employees.length}");
  }

  void remove() {
    _employeeDataSource.employees.removeLast();
    _employeeDataSource.updateDataGridRows();
    _employeeDataSource.updateDataGridSource();
    print("[remove] employees.length : ${employees.length}");
  }

  void find() {
    // await 조회 추가
    _employeeDataSource.updateDataGridRows();
    _employeeDataSource.updateDataGridSource();
    print("[find] employees.length : ${employees.length}");
  }
}
