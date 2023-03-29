import 'link.dart';
import 'section.dart';

class Resume {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final List<Link> links;
  final List<Section> sections;

  Resume({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.links,
    required this.sections,
  });

  factory Resume.fromJson(Map<String, dynamic> json) {
    return Resume(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      links: (json['links'] as List).map((e) => Link.fromJson(e)).toList(),
      sections:
          (json['sections'] as List).map((e) => Section.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'links': links.map((link) => link.toJson()).toList(),
      'sections': sections.map((section) => section.toJson()).toList(),
    };
  }
}
