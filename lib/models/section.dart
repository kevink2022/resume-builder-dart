import 'job.dart';
import 'project.dart';
import 'component.dart';
import 'checkable.dart';

//abstract class Component {}

enum SectionType { job, project }

class Section with Checkable {
  String title;
  SectionType type;
  List<Component> components;

  Section({
    required this.title,
    required this.type,
    required this.components,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    SectionType sectionType = _sectionTypeFromString(json['type']);
    List<Component> components = [];

    if (sectionType == SectionType.job) {
      components = (json['components'] as List)
          .map((e) => Job.fromJson(e['data'] as Map<String, dynamic>))
          .toList();
    } else if (sectionType == SectionType.project) {
      components = (json['components'] as List)
          .map((e) => Project.fromJson(e['data'] as Map<String, dynamic>))
          .toList();
    }

    return Section(
        title: json['title'], type: sectionType, components: components);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'components': components.map((c) => _componentToJson(c)).toList(),
    };
  }

  static List<Component> _parseComponents(List<dynamic> jsonList) {
    return jsonList.map<Component>((e) {
      switch (e['type']) {
        case 'job':
          return Job.fromJson(e);
        case 'project':
          return Project.fromJson(e);
        // Add other component types here.
        default:
          throw Exception('Unknown component type: ${e['type']}');
      }
    }).toList();
  }

  static Map<String, dynamic> _componentToJson(Component component) {
    if (component is Job) {
      return component.toJson();
    } else if (component is Project) {
      return component.toJson();
    }
    // Add other component types here.
    throw Exception('Unknown component type: ${component.runtimeType}');
  }

  static SectionType _sectionTypeFromString(String typeString) {
    switch (typeString) {
      case 'job':
        return SectionType.job;
      case 'project':
        return SectionType.project;
      default:
        throw Exception('Unknown section type: $typeString');
    }
  }

  static String _sectionTypeToString(SectionType sectionType) {
    switch (sectionType) {
      case SectionType.job:
        return 'job';
      case SectionType.project:
        return 'project';
      default:
        throw Exception('Unknown section type: $sectionType');
    }
  }
}
