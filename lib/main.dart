import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_datagrid_proj/controller/employee_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/employee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SfDataGrid Editing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final con = Get.put(EmployeeController());
  DataGridController _dataGridController = DataGridController();
  /* late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];
  late DataGridController _dataGridController;

  @override
  void initState() {
    super.initState();
    // _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    _dataGridController = DataGridController();
  } */

  @override
  Widget build(BuildContext context) {
    print("★ build");
    return Scaffold(
      appBar: AppBar(
        title: Text('SfDataGrid Editing'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // _employees.add(Employee(1, 'donpark', 'dev', 100));
                  // _employeeDataSource.employees.add(Employee(1, 'donpark', 'dev', 100));
                  // _employeeDataSource.updateDataGridRows();
                  // _employeeDataSource.updateDataGridSource();
                  // print(_employees.length);
                  con.add();
                },
                child: Text("추가"),
              ),
              ElevatedButton(
                onPressed: () {
                  // _employeeDataSource.employees.removeLast();
                  // _employeeDataSource.updateDataGridRows();
                  // _employeeDataSource.updateDataGridSource();
                  con.remove();
                },
                child: Text("삭제"),
              ),
              ElevatedButton(
                onPressed: () {
                  // await 조회 추가
                  // _employeeDataSource.updateDataGridRows();
                  // _employeeDataSource.updateDataGridSource();
                  con.find();
                },
                child: Text("조회"),
              ),
            ],
          ),
          Expanded(
            child: SfDataGrid(
              // source: _employeeDataSource,
              source: con.employeeDataSource,
              allowEditing: true,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              columnWidthMode: ColumnWidthMode.fill,
              controller: _dataGridController,
              columns: [
                GridColumn(
                  columnName: 'id',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'ID',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'name',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'designation',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Designation',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'salary',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Salary',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}
