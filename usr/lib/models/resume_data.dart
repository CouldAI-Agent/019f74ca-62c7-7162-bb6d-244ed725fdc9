class ResumeData {
  String name;
  String email;
  String phone;
  String location;
  String objective;
  List<Education> education;
  List<String> skills;
  List<Project> projects;

  ResumeData({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.objective = '',
    this.education = const [],
    this.skills = const [],
    this.projects = const [],
  });
}

class Education {
  String degree;
  String institution;
  String year;
  String grade;

  Education({
    this.degree = '',
    this.institution = '',
    this.year = '',
    this.grade = '',
  });
}

class Project {
  String title;
  String description;

  Project({
    this.title = '',
    this.description = '',
  });
}
