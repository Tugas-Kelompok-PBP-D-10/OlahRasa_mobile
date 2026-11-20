
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
              Tab(text: 'Profile'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _LoginTab(),
                _RegisterTab(),
                _ProfileTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginTab extends StatelessWidget {
  const _LoginTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Icon(Icons.restaurant_menu,
            size: 70, color: Colors.green),
        const SizedBox(height: 16),
        const Text(
          'Selamat Datang di OlahRasa',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const FilledButton(
          onPressed: null,
          child: Text('Login'),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: null,
          icon: const Icon(Icons.account_circle),
          label: const Text('Login dengan Google'),
        ),
        const SizedBox(height: 16),
        const Text(
          'Preview CP1 - autentikasi belum terintegrasi.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _RegisterTab extends StatelessWidget {
  const _RegisterTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text(
          'Buat Akun OlahRasa',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Konfirmasi Password',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        FilledButton(
          onPressed: null,
          child: Text('Register'),
        ),
        SizedBox(height: 12),
        Text('Preview CP1 - registrasi belum terintegrasi.'),
      ],
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Center(
          child: CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 55),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Profil Pengguna',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 24),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Username'),
          subtitle: Text('Belum login'),
        ),
        ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text('Email'),
          subtitle: Text('Belum tersedia'),
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('Google Account'),
          subtitle: Text('Belum terhubung'),
        ),
        SizedBox(height: 20),
        FilledButton(
          onPressed: null,
          child: Text('Logout'),
        ),
        SizedBox(height: 12),
        Text(
          'Preview CP1 - data profil belum terintegrasi.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
