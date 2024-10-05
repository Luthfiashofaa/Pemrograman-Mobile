import 'package:book/app/modules/detail-story/views/komentar-view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package for navigation

class ReadPage extends StatelessWidget {
  // Sample chapters data with extended content
  final List<String> chapters = [
    'Selin Ananta, cewek penuh semangat yang dijadikan objek balas dendam oleh Saga. Cowok itu menduga bahwa Selin berhubungan dengan semua paket hitam yang diterimanya secara misterius selama ini. Paket yang membuat Mamanya terguncang, serta membuatnya membenci sosok Papa. Bagi Saga, Selin adalah sumber masalah. Sebaliknya, bagi Selin, Saga adalah kotanya. '
        'Semakin Saga menyakiti Selin, cewek itu justru tidak gentar mendekatinya. Siapa sangka rupanya Selin hadir di hidupnya dengan membawa misi penting. Selin selalu berusaha menunjukkan sisi baiknya, meskipun Saga tidak pernah memberi kesempatan untuk berbuat demikian. Dalam setiap pertemuan, ketegangan di antara mereka semakin terasa, tetapi di balik semua itu, ada ketertarikan yang tidak bisa dipungkiri. '
        'Saga, yang dulunya ceria, kini terjebak dalam dunia gelap yang penuh dengan masalah keluarganya. Dia tidak tahu bagaimana caranya keluar dari belenggu itu. Ketika Selin hadir dalam hidupnya, dia merasa seolah ada harapan baru, tetapi rasa sakit yang ditimbulkan dari masa lalu menghalangi langkahnya. Dia harus belajar untuk mempercayai Selin, tetapi setiap kali dia berusaha, selalu ada keraguan yang menyertai. '
        'Bagaimana selanjutnya? Apakah Saga akan membiarkan Selin pergi atau justru akan menyadari bahwa Selin adalah jawaban dari segala masalahnya?',
    'Selin dan Saga kini berada di ambang perang, dengan segala tipu daya dan intrik yang mengelilingi mereka. Saga mulai menyadari bahwa Selin bukanlah masalah, melainkan kunci untuk menyelesaikan segala permasalahannya. Namun, banyak rintangan yang harus mereka lewati bersama. Masing-masing memiliki sejarah dan beban emosional yang tidak mudah dihilangkan. '
        'Saga merasa terjebak antara dua pilihan: melindungi Selin atau mempertahankan dirinya sendiri. Dia tidak ingin melukai Selin lebih jauh, tetapi perasaannya semakin rumit seiring dengan semakin dekatnya mereka. Setiap senyuman Selin, setiap tawa yang terucap dari bibirnya, menjadi obat bagi luka yang dialaminya. Namun, di saat yang sama, itu juga menambah rasa sakit karena dia tahu betapa rapuhnya hubungan mereka. '
        'Dalam perjalanan mereka, Selin harus menghadapi kenyataan pahit tentang keluarganya sendiri, dan Saga harus berjuang melawan semua hal yang menghalanginya untuk mencintai. Apakah mereka akan mampu bertahan dari semua ini?',
    'Misi Selin semakin jelas, dan Saga harus memilih antara menghancurkan atau melindungi Selin. Ketegangan antara mereka semakin meningkat, dan keputusan yang diambil akan menentukan nasib mereka berdua. Saga yang keras kepala kini mulai melihat sisi lain dari Selin, dan Selin juga mulai memahami alasan di balik setiap tindakan Saga. '
        'Ketika mereka terjebak dalam situasi berbahaya, saling bergantung satu sama lain adalah satu-satunya pilihan. Dengan perasaan yang semakin kuat, Saga dan Selin berjuang untuk mencari cara agar dapat menghadapi dunia yang berusaha memisahkan mereka. Dalam perjalanan ini, mereka akan belajar bahwa cinta bukan hanya tentang perasaan, tetapi juga tentang pengorbanan dan kepercayaan. '
        'Akhirnya, Saga harus mengambil keputusan sulit: apakah dia akan mengorbankan segalanya untuk menyelamatkan Selin, atau akan melindungi dirinya sendiri? Pilihan yang diambil akan menentukan bukan hanya masa depan mereka, tetapi juga masa depan orang-orang di sekitar mereka.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter One'), // Title remains "Chapter One"
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page (HomeView)
          },
        ),
      ),
      body: PageView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chapter One', // All chapters titled "Chapter One"
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    chapters[index], // Display chapter content based on index
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Comment icon section
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => CommentPage());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.comment, size: 24, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Komentar',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
