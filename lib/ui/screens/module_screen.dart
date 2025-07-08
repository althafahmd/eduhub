import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/routes/auto_route.gr.dart';
import '../../core/models/module.dart';
import '../widgets/module_tile.dart';
import '../../utilities/app_typography.dart';
import '../../utilities/app_colors.dart';

@RoutePage()
class ModuleScreen extends StatefulWidget {
  final int subjectId;
  const ModuleScreen({super.key, required this.subjectId});

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  List<dynamic> modules = [];
  bool isLoading = true;

  ModuleModel moduleModel = ModuleModel();

  @override
  void initState() {
    super.initState();
    fetchModuleData();
  }

  void fetchModuleData() async {
    try {
      var data = await moduleModel.getModule(widget.subjectId.toString());
      setState(() {
        modules = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching modules: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlue),
        ),
        title: Text(
          'EduHub',
          style: AppTypography.headlineLarge.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CupertinoActivityIndicator())
            : modules.isEmpty
            ? Center(child: Text('No modules found'))
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: modules.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final module = modules[index];
                        return ModuleTile(
                          moduleTitle: module['title'] ?? 'No title',
                          moduleIndex: module['id'] ?? index,
                          onTap: () {
                            final moduleId = module['id'];
                            context.router.push(VideoRoute(moduleId: moduleId));
                          },
                        );
                      },
                    ),
                    Gap(MediaQuery.paddingOf(context).bottom + 20),
                  ],
                ),
              ),
      ),
    );
  }
}
