import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Tambahkan halaman tulis resep baru
class WriteRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              'Tulis Resep Baru',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implementasi form tulis resep
                // Misalnya navigasi ke halaman form atau modal
                Get.toNamed('/write-recipe-form');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Mulai Menulis Resep',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Existing ProfileScreen remains the same
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Profil Pengguna',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.orange[100],
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pengguna',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'email@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/account_screen'); // Navigasi ke halaman account_screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Pengelolaan Akun',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Akun
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Pengelolaan Akun',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Halaman Pengelolaan Akun',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Modifikasi HomeScreen untuk menambahkan bottom navigation
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Telur Dadar Padang',
      'category': 'Main Course',
      'duration': '10 min',
      'image': 'assets/telur_dadar_padang.jpg',
      'isSpecial': true,
      'ingredients': [
        '4 telur',
        'Daun bawang cincang',
        'Garam',
        'Merica',
        'Minyak goreng'
      ],
      'description': 'Telur dadar khas Padang yang lezat dan gurih, biasa disajikan dengan sambal.'
    },
    {
      'name': 'Nasi Goreng',
      'category': 'Main Course',
      'duration': '20 min',
      'image': 'assets/nasi_goreng.jpg',
      'isSpecial': false,
      'ingredients': [
        'Nasi putih',
        'Bawang merah',
        'Bawang putih',
        'Kecap manis',
        'Telur',
        'Minyak goreng'
      ],
      'description': 'Hidangan klasik Indonesia yang populer, cocok untuk sarapan atau makan malam.'
    },
    {
      'name': 'Soto Ayam',
      'category': 'Soup',
      'duration': '45 min',
      'image': 'assets/soto_ayam.jpg',
      'isSpecial': false,
      'ingredients': [
        'Ayam',
        'Kaldu ayam',
        'Daun salam',
        'Serai',
        'Jahe',
        'Bawang putih',
        'Bawang merah'
      ],
      'description': 'Sup ayam tradisional Indonesia dengan rempah-rempah yang kaya akan cita rasa.'
    },
    {
      'name': 'Rendang',
      'category': 'Main Course',
      'duration': '120 min',
      'image': 'assets/rendang.jpg',
      'isSpecial': true,
      'ingredients': [
        'Daging sapi',
        'Santan',
        'Cabai merah',
        'Bawang merah',
        'Bawang putih',
        'Jahe',
        'Kunyit',
        'Lengkuas'
      ],
      'description': 'Hidangan khas Padang dengan daging yang dimasak lama dengan bumbu kaya rempah.'
    },
    {
      'name': 'Gado-Gado',
      'category': 'Salad',
      'duration': '30 min',
      'image': 'assets/gado_gado.jpg',
      'isSpecial': false,
      'ingredients': [
        'Sayur rebus (kubis, wortel, kacang panjang)',
        'Kentang rebus',
        'Tahu',
        'Tempe',
        'Telur rebus',
        'Bumbu kacang'
      ],
      'description': 'Salad sayur Indonesia yang disajikan dengan bumbu kacang yang khas.'
    },
    {
      'name': 'Sate Ayam',
      'category': 'Appetizer',
      'duration': '40 min',
      'image': 'assets/sate_ayam.jpg',
      'isSpecial': true,
      'ingredients': [
        'Daging ayam',
        'Kecap manis',
        'Bawang putih',
        'Kacang tanah',
        'Cabai',
        'Kecap manis'
      ],
      'description': 'Sate ayam dengan bumbu kacang yang nikmat, cocok sebagai hidangan pembuka.'
    },
    {
      'name': 'Bakso',
      'category': 'Soup',
      'duration': '35 min',
      'image': 'assets/bakso.jpg',
      'isSpecial': false,
      'ingredients': [
        'Daging giling',
        'Tepung tapioka',
        'Telur',
        'Bawang putih',
        'Kaldu sapi',
        'Mie',
        'Sayur'
      ],
      'description': 'Hidangan bakso dengan kuah kaldu yang hangat dan mengenyangkan.'
    },
    {
      'name': 'Sayur Lodeh',
      'category': 'Soup',
      'duration': '40 min',
      'image': 'assets/sayur_lodeh.jpg',
      'isSpecial': false,
      'ingredients': [
        'Santan',
        'Wortel',
        'Terong',
        'Kacang panjang',
        'Cabai',
        'Daun salam',
        'Lengkuas'
      ],
      'description': 'Sayur berkuah santan dengan berbagai macam sayuran segar.'
    },
    {
      'name': 'Pisang Goreng',
      'category': 'Dessert',
      'duration': '15 min',
      'image': 'assets/pisang_goreng.jpg',
      'isSpecial': false,
      'ingredients': [
        'Pisang matang',
        'Tepung beras',
        'Tepung terigu',
        'Garam',
        'Air',
        'Minyak goreng'
      ],
      'description': 'Camilan manis yang renyah di luar dan lembut di dalam.'
    },
    {
      'name': 'Martabak Manis',
      'category': 'Dessert',
      'duration': '30 min',
      'image': 'assets/martabak_manis.jpg',
      'isSpecial': true,
      'ingredients': [
        'Tepung terigu',
        'Telur',
        'Susu',
        'Gula',
        'Mentega',
        'Cokelat',
        'Kacang'
      ],
      'description': 'Terang bulan manis dengan berbagai pilihan topping.'
    }
  ];

  List<Map<String, dynamic>> filteredRecipes = [];
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  // Daftar halaman untuk bottom navigation (tambah satu halaman)
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
    searchController.addListener(() {
      filterRecipes();
    });

    // Inisialisasi _pages di sini
    _pages = [
      // Halaman utama (resep)
      Builder(
        builder: (context) {
          return Column(
            children: [
              // Search Bar
              Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: context.findAncestorStateOfType<_HomeScreenState>()!.searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari resep...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
              ),

              // Recipe List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: context.findAncestorStateOfType<_HomeScreenState>()!.filteredRecipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        recipe: context.findAncestorStateOfType<_HomeScreenState>()!.filteredRecipes[index]
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      // Halaman Tulis Resep Baru
      WriteRecipeScreen(),
      // Halaman profil
      ProfileScreen(),
    ];
  }

  void filterRecipes() {
    setState(() {
      filteredRecipes = recipes
          .where((recipe) => recipe['name']
          .toLowerCase()
          .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  // Fungsi untuk mengubah halaman pada bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          _selectedIndex == 0
              ? 'Resep Masakan'
              : _selectedIndex == 1
              ? 'Tulis Resep'
              : 'Profil Pengguna',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Tulis Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Existing RecipeCard and FeatureButton classes remain the same
class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(recipe['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              recipe['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${recipe['category']} • ${recipe['duration']}'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          if (recipe['isSpecial'] == true)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureButton(
                    icon: Icons.camera_alt,
                    label: 'Scan Hasil/Bahan',
                    route: '/camera',
                  ),
                  FeatureButton(
                    icon: Icons.mic,
                    label: 'Rekam Resep Versi Anda',
                    route: '/microphone',
                  ),
                  FeatureButton(
                    icon: Icons.volume_up,
                    label: 'Dengar Resep',
                    route: '/speaker',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const FeatureButton({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => Get.toNamed(route),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}