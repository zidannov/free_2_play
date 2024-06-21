## Free2Play

Free2Play adalah aplikasi Flutter yang memungkinkan pengguna menemukan dan menjelajahi berbagai game gratis dari seluruh dunia. Aplikasi ini memanfaatkan API publik untuk mengambil informasi tentang game gratis terbaru dan terpopuler di berbagai platform.

### Fitur Utama

* **Daftar Game Gratis:** Tampilan daftar game gratis yang menarik dan mudah dinavigasi.
* **Detail Game:** Informasi lengkap tentang setiap game, termasuk deskripsi, genre, platform, tanggal rilis, gambar, dan lainnya.
* **Pencarian:** Fitur pencarian yang kuat untuk menemukan game berdasarkan judul, genre, atau platform.
* **Chatbot:** Pengguna dapat menanyakan seputar game kepada chatbot.

### Teknologi yang Digunakan

* **Flutter:** Framework UI lintas platform untuk membangun aplikasi yang indah dan responsif.
* **Dart:** Bahasa pemrograman yang digunakan untuk mengembangkan aplikasi Flutter.
* **REST API:** Digunakan untuk mengambil data game dari sumber eksternal.
* **GetX:** Untuk manajemen state aplikasi.

### Instalasi

1. Pastikan Anda telah menginstal Flutter dan Dart di sistem Anda.
2. Clone repositori ini: `git clone https://github.com/username-anda/free2play.git`
3. Masuk ke direktori project: `cd free2play`
4. Install dependencies: `flutter pub get`
5. Jalankan aplikasi: `flutter run`

### Konfigurasi API

1. **Buat file `.env`:** Di direktori root project Anda, buat file bernama `.env`.
2. **Tambahkan variabel lingkungan:** Isi file `.env` dengan variabel-variabel berikut:

   ```
   BASE_URL=https://contoh-api.com/
   RAPIDAPI_KEY=your_rapidapi_key
   RAPIDAPI_HOST=your_rapidapi_host
   GEMINI_API_KEY=your_gemini_api_key
   ```

   **Penting:** Ganti nilai kosong (`=`) dengan nilai API key dan host yang sesuai dari penyedia API yang Anda gunakan.

Dengan ini, pengguna yang ingin menjalankan project Anda hanya perlu mengisi nilai-nilai yang sesuai di file `.env` tanpa perlu mengubah kode sumber aplikasi.


### Struktur Project

* `lib/`: Berisi semua kode sumber aplikasi.
* `lib/models/`: Berisi model data untuk game.
* `lib/screens/`: Berisi widget layar aplikasi.
* `lib/services/`: Berisi layanan untuk mengambil data dari API.
* `lib/widgets/`: Berisi widget UI yang dapat digunakan kembali.

### Kontribusi

Kontribusi sangat diterima! Jika Anda menemukan bug atau ingin menambahkan fitur baru, silakan buat pull request.
