import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/routes/auto_route.gr.dart';
import '../../utilities/app_typography.dart';
import '../../core/models/subject.dart';
import '../widgets/subject_card.dart';
import '../../utilities/app_colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<dynamic> subjects = [];
  bool isLoading = true;

  SubjectModel subjectModel = SubjectModel();

  @override
  void initState() {
    super.initState();
    fetchSubjectData();
  }

  void fetchSubjectData() async {
    try {
      var data = await subjectModel.getSubject();
      setState(() {
        subjects = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching subjects: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBG,
      body: SafeArea(
        child: isLoading
            ? Center(child: CupertinoActivityIndicator())
            : subjects.isEmpty
            ? Center(child: Text('No subjects found!'))
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Text(
                        'Subjects',
                        style: AppTypography.headlineLarge.copyWith(
                          color: AppColors.primaryBlue,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: subjects.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        return SubjectCard(
                          title: subject['title'] ?? 'No title',
                          description:
                              subject['description'] ?? 'No description',
                          image:
                              subject['image'] ??
                              'assets/images/placeholder.png',
                          onTap: () {
                            final subjectId = subject['id'];
                            context.router.push(
                              ModuleRoute(subjectId: subjectId),
                            );
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

  @override
  void dispose() {
    super.dispose();
  }
}
