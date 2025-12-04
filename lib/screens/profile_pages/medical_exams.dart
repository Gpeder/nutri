import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/models/medical_exams.dart';
import 'package:nutri/screens/profile_pages/widgets/button_filter.dart';
import 'package:nutri/screens/profile_pages/widgets/send_document.dart';
import 'package:nutri/widgets/genericappbar.dart';

import 'package:nutri/screens/profile_pages/widgets/medical_exam_card.dart';

class MedicalExams extends StatefulWidget {
  const MedicalExams({super.key});

  @override
  State<MedicalExams> createState() => _MedicalExamsState();
}

class _MedicalExamsState extends State<MedicalExams> {
  int selectedIndex = 0;
  final List<String> categories = ['Todos', 'Sangue', 'Imagem', 'Cardio'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        icon: FontAwesomeIcons.angleLeft,
        title: 'Exames',
        subtitle: 'Central de resultados',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            const SendDocument(),
            const SizedBox(height: 20),
            _filterList(),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) =>
                    MedicalExamCard(
                      title: MedicalExam.mocks[index].title,
                      date: MedicalExam.mocks[index].dateFormatted,
                      status: MedicalExam.mocks[index].status,
                      filePath: MedicalExam.mocks[index].filePath,
                    ),
                itemCount: MedicalExam.mocks.length,
                )
          ],
        ),
      ),
    );
  }

  Widget _filterList() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ButtonFilter(
              text: categories[index],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
