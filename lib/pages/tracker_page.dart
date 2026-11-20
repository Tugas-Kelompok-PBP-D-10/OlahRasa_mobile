import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final _formKey = GlobalKey<FormState>();
  final _protein = TextEditingController();
  final _carbs = TextEditingController();
  final _fat = TextEditingController();

  int? _savedProtein, _savedCarbs, _savedFat;

  bool get _hasTarget => _savedProtein != null;

  @override
  void dispose() {
    _protein.dispose();
    _carbs.dispose();
    _fat.dispose();
    super.dispose();
  }

  String? _validate(String? v) {
    final n = int.tryParse((v ?? '').trim());
    if (n == null) return 'Isi dengan angka';
    if (n < 1 || n > 10000) return 'Harus antara 1 - 10.000';
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    // TODO(API): POST /api/nutrition-target/ dengan protein, carbs, fat
    setState(() {
      _savedProtein = int.parse(_protein.text.trim());
      _savedCarbs = int.parse(_carbs.text.trim());
      _savedFat = int.parse(_fat.text.trim());
    });
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Target nutrisi disimpan')),
    );
  }

  void _edit() {
    _protein.text = '${_savedProtein ?? ''}';
    _carbs.text = '${_savedCarbs ?? ''}';
    _fat.text = '${_savedFat ?? ''}';
    setState(() {
      _savedProtein = _savedCarbs = _savedFat = null;
    });
  }

  void _delete() {
    // TODO(API): DELETE target
    setState(() {
      _savedProtein = _savedCarbs = _savedFat = null;
      _protein.clear();
      _carbs.clear();
      _fat.clear();
    });
  }

  Widget _field(String label, TextEditingController c) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextFormField(
          controller: c,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            suffixText: 'g',
            border: const OutlineInputBorder(),
          ),
          validator: _validate,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Tracker', style: text.headlineSmall),
        const SizedBox(height: 4),
        Text('Pantau aktivitas memasak dan nutrisimu.',
            style: text.bodyMedium),
        const SizedBox(height: 20),

        // ---------- Input Nutrition Target ----------
        Text('Nutrition Target', style: text.titleLarge),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _hasTarget ? _buildSaved(context) : _buildForm(),
          ),
        ),
        const SizedBox(height: 24),

        // ---------- Coming soon ----------
        Text('Segera Hadir', style: text.titleLarge),
        const SizedBox(height: 8),
        const _ComingSoonTile(
          icon: Icons.local_fire_department,
          title: 'Cooking Streak',
          subtitle: 'Current dan longest streak memasak.',
        ),
        const _ComingSoonTile(
          icon: Icons.calendar_month,
          title: 'Weekly Cooking Activity',
          subtitle: 'Aktivitas memasak Senin sampai Minggu.',
        ),
        const _ComingSoonTile(
          icon: Icons.bar_chart,
          title: 'Nutrition Progress',
          subtitle: 'Progres protein, carbs, dan fat terhadap targetmu.',
        ),
        const _ComingSoonTile(
          icon: Icons.history,
          title: 'Cooking History',
          subtitle: 'Riwayat resep yang sudah kamu masak.',
        ),
        const _ComingSoonTile(
          icon: Icons.emoji_events,
          title: 'Achievements',
          subtitle: 'Badge dari streak dan total aktivitas memasak.',
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Atur target nutrisi mingguanmu (1 - 10.000 g).'),
          const SizedBox(height: 16),
          _field('Protein', _protein),
          _field('Carbs', _carbs),
          _field('Fat', _fat),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _save,
              child: const Text('Simpan Target'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaved(BuildContext context) {
    Widget item(String label, int value) => Expanded(
          child: Column(
            children: [
              Text('$value g',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text(label, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        );
    return Column(
      children: [
        Row(children: [
          item('Protein', _savedProtein!),
          item('Carbs', _savedCarbs!),
          item('Fat', _savedFat!),
        ]),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: _edit,
              icon: const Icon(Icons.edit),
              label: const Text('Ubah'),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: _delete,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Hapus'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ComingSoonTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _ComingSoonTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: 0.7,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: scheme.surfaceContainerHighest,
            child: Icon(icon, color: scheme.outline),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Chip(
            label: Text('Coming Soon'),
            visualDensity: VisualDensity.compact,
          ),
        ),
      ),
    );
  }
}