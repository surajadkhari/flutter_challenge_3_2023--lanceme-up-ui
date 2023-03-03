class WorkModel {
  final String projectName;
  final String template;
  final String status;
  final String lastUpdated;
  final int workPercent;

  WorkModel(
      {required this.projectName,
      required this.template,
      required this.status,
      required this.lastUpdated,
      required this.workPercent});

  static List<WorkModel> workList = [
    WorkModel(
        projectName: "Revamp Project",
        template: "Kanban",
        status: "On Hold",
        lastUpdated: "2 m ago",
        workPercent: 40),
    WorkModel(
        projectName: "Revamp Project",
        template: "Kanban",
        status: "On Hold",
        lastUpdated: "2 m ago",
        workPercent: 30),
    WorkModel(
        projectName: "Revamp Project",
        template: "Kanban",
        status: "On Hold",
        lastUpdated: "2 m ago",
        workPercent: 45),
    WorkModel(
        projectName: "Revamp Project",
        template: "Kanban",
        status: "On Hold",
        lastUpdated: "2 m ago",
        workPercent: 45),
  ];
}
