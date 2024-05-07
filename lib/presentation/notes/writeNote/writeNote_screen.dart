import 'package:eduvibe/core/widget/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/ev_colors.dart';

class WriteNoteScreen extends StatefulWidget {
  @override
  State<WriteNoteScreen> createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  String title = '';
  String subtitle = '';
  Color selectedColor = Color(0xFFD9D9D9);

  // Default color
  List<Color> colors = [
    Color(0xFFD9D9D9),
    Color(0xFFEFC7B0),
    Color(0xFFE46A6A),
    Color(0xFFF63636),
    Color(0xFFA86666),
    Color(0xFF862E2E),
    Color(0xFF510707),
    Color(0xFFF6B76D),
    Color(0xFFC7653B),
    Color(0xFF4DDEFE),
    Color(0xFFB0EEEF),
    Color(0xFFB0BEEF),
    Color(0xFF4D4F58),
    Color(0xFF8C00F9),
    Color(0xFFCA1FAF),
    Color(0xFF2573E9),
    Color(0xFF2F687A),
    Color(0xFF48BDBD),
    Color(0xFF2E863C),
    Color(0xFF69BD4B),
    Color(0xFFBFDE42),
    Color(0xFFFFE76A),
    Color(0xFFF0BB01),
  ];
  final GlobalKey<FormState> formKey =GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: EVColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notes",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: EVColors.backgroundDark),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, size: 24, color: EVColors.backgroundDark),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 187,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: EVColors.onBackground87Dark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: EVColors.onBackground87Light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Title',
                  style: TextStyle(
                      color: EVColors.onBackground87Light,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: EVColors.backgroundLight,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: EVColors.onBackground37Light)),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: TextFormField(
                        style: const TextStyle(
                          color: EVColors.onBackground87Light,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        // controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'Type the note title',
                          hintStyle: TextStyle(
                            color: EVColors.onBackground60Light,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          prefixText: '    ',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                          // context.read<WriteNoteCubit>().setTitle(value);
                        },
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Note',
                  style: TextStyle(
                      color: EVColors.onBackground87Light,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 142,
                  decoration: BoxDecoration(
                      color: EVColors.backgroundLight,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: EVColors.onBackground37Light)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: EVColors.onBackground87Light,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Type the note',
                        hintStyle: TextStyle(
                          color: EVColors.onBackground60Light,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        prefixText: '    ',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          subtitle = value;
                        });
                        // context.read<WriteNoteCubit>().setSubtitle(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 13,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colors[index];
                        });
                        // context.read<WriteNoteCubit>().setSelectedColor(colors[index]);
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == colors[index]
                                ? Colors.black
                                : Colors.transparent,
                            width: 2, // Border width
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 56,
                ),
                PrimaryButton(
                    text: 'add',
                    onPressed: () async {
                    },
                    backgroundColor: EVColors.primaryLight,
                    textColor: EVColors.backgroundLight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


