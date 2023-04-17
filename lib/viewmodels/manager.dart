import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:resume_builder/models/resume.dart';
import 'package:resume_builder/models/resume_data.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class Manager extends ChangeNotifier {
  Resume resume;

  factory Manager() {
    // String jsonData = File('assets/resume_data.json').readAsStringSync();
    // Map<String, dynamic> data = json.decode(jsonData);
    Map<String, dynamic> data = json.decode(resumeDataJson);
    return Manager._(Resume.fromJson(data));
  }

  Manager._(this.resume);

  Future<void> generateTeX() async {
    // Get the application documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();

    // Set the path for the new TeX file
    String newFilePath = appDocDir.path + '/generated_resume.tex';

    // Pick the template file using file_picker package
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['tex'],
    );

    if (result != null) {
      File templateFile = File(result.files.single.path!);

      // Copy the template file to the new file
      await templateFile.copy(newFilePath);

      // Open the new file and append the document data from the resume
      File newFile = File(newFilePath);
      String currentContent = await newFile.readAsString();

      resume.sections.forEach((section) {
        print('Section isChecked: ${section.isChecked}');
        section.components.forEach((component) {
          print('Component isChecked: ${component.isChecked}');
          if (true) {
            component.bullets.forEach((bullet) {
              print('Bullet isChecked: ${bullet.isChecked}');
            });
          }
        });
      });

      String updatedContent =
          '$currentContent\n\\begin{document}\n${resume.toLaTeX()}\n\\end{document}\n';
      await newFile.writeAsString(updatedContent);
    } else {
      print('User canceled the file picker');
    }
  }
}
