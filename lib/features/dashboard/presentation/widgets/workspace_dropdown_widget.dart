import 'package:flutter/material.dart';
import '../../data/models/workspace_model/workspace_model.dart';

class WorkspaceDropDown extends StatefulWidget {
  const WorkspaceDropDown({super.key});

  @override
  State<WorkspaceDropDown> createState() => _WorkspaceDropDownState();
}

class _WorkspaceDropDownState extends State<WorkspaceDropDown> {
  WorkSpaceModel selectedDropdownItem = WorkSpaceModel.workspaceList[0];
  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        value: selectedDropdownItem,
        onChanged: (WorkSpaceModel? newValue) {
          setState(() {
            selectedDropdownItem = newValue!;
          });
        },
        icon: const SizedBox(
          width: 60, // Set the width of the icon
          child: Icon(Icons.expand_more_outlined),
        ),
        items: WorkSpaceModel.workspaceList.map((WorkSpaceModel dropdownItem) {
          return DropdownMenuItem(
            value: dropdownItem,
            child: Row(
              children: [
                Container(
                  height: screenW * 0.1,
                  width: screenW * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(dropdownItem.logo))),
                ),
                const SizedBox(width: 20),
                Text(
                  dropdownItem.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
