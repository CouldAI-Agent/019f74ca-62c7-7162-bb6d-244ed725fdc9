import 'package:flutter/material.dart';

void main() {
  runApp(const FresherResumeApp());
}

class FresherResumeApp extends StatelessWidget {
  const FresherResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresher Resume Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeFormScreen(),
      },
    );
  }
}

class ResumeData {
  String name = '';
  String email = '';
  String phone = '';
  String summary = '';
  String degree = '';
  String school = '';
  String gradYear = '';
  String skills = '';
  String projectTitle = '';
  String projectDesc = '';
}

class ResumeFormScreen extends StatefulWidget {
  const ResumeFormScreen({super.key});

  @override
  State<ResumeFormScreen> createState() => _ResumeFormScreenState();
}

class _ResumeFormScreenState extends State<ResumeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ResumeData _data = ResumeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresher Resume Builder'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('Personal Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  onSaved: (val) => _data.name = val ?? '',
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (val) => _data.email = val ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                  onSaved: (val) => _data.phone = val ?? '',
                ),
                const SizedBox(height: 16),
                const Text('Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Professional Summary'),
                  maxLines: 3,
                  onSaved: (val) => _data.summary = val ?? '',
                ),
                const SizedBox(height: 16),
                const Text('Education', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Degree (e.g. B.S. Computer Science)'),
                  onSaved: (val) => _data.degree = val ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'University / School'),
                  onSaved: (val) => _data.school = val ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Graduation Year'),
                  onSaved: (val) => _data.gradYear = val ?? '',
                ),
                const SizedBox(height: 16),
                const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Skills (comma separated)'),
                  onSaved: (val) => _data.skills = val ?? '',
                ),
                const SizedBox(height: 16),
                const Text('Key Project', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Project Title'),
                  onSaved: (val) => _data.projectTitle = val ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Project Description'),
                  maxLines: 2,
                  onSaved: (val) => _data.projectDesc = val ?? '',
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResumePreviewScreen(data: _data),
                        ),
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Generate Resume', style: TextStyle(fontSize: 18)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResumePreviewScreen extends StatelessWidget {
  final ResumeData data;
  const ResumePreviewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Preview'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(data.name, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('${data.email} | ${data.phone}'),
                        ],
                      ),
                    ),
                    const Divider(height: 32, thickness: 2),
                    if (data.summary.isNotEmpty) ...[
                      Text('Professional Summary', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal)),
                      const SizedBox(height: 8),
                      Text(data.summary),
                      const SizedBox(height: 16),
                    ],
                    Text('Education', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal)),
                    const SizedBox(height: 8),
                    Text(data.degree, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('${data.school} - Class of ${data.gradYear}'),
                    const SizedBox(height: 16),
                    if (data.skills.isNotEmpty) ...[
                      Text('Skills', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal)),
                      const SizedBox(height: 8),
                      Text(data.skills),
                      const SizedBox(height: 16),
                    ],
                    if (data.projectTitle.isNotEmpty) ...[
                      Text('Projects', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal)),
                      const SizedBox(height: 8),
                      Text(data.projectTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(data.projectDesc),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
