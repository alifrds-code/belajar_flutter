import 'package:belajar_flutter/tugas9/dataModel.dart';

class Club {
  final String nama;
  final String negara;
  final int jumlahUCL;
  final String foto;

  Club({
    required this.nama,
    required this.negara,
    required this.jumlahUCL,
    required this.foto,
  });
}

final List<Club> clubList = [
  Club(
    nama: "Real Madrid",
    negara: "Spanyol",
    jumlahUCL: 15,
    foto:
        "https://imageio.forbes.com/i-forbesimg/media/lists/teams/real-madrid_416x416.jpg?format=jpg",
  ),
  Club(
    nama: "Barcelona",
    negara: "Spanyol",
    jumlahUCL: 5,
    foto:
        "https://upload.wikimedia.org/wikipedia/id/thumb/4/47/FC_Barcelona_%28crest%29.svg/1280px-FC_Barcelona_%28crest%29.svg.png",
  ),
  Club(
    nama: "King Emyu",
    negara: "Inggris",
    jumlahUCL: 200,
    foto:
        "https://i.ytimg.com/vi/cTQWzhwPV4I/maxresdefault.jpg",
  ),
  Club(
    nama: "Liverpool",
    negara: "Inggris",
    jumlahUCL: 6,
    foto:
        "https://upload.wikimedia.org/wikipedia/id/thumb/0/0c/Liverpool_FC.svg/500px-Liverpool_FC.svg.png?20110531104209",
  ),
  Club(
    nama: "Bayern Munich",
    negara: "Jerman",
    jumlahUCL: 6,
    foto:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/FC_Bayern_M%C3%BCnchen_logo_%282024%29.svg/960px-FC_Bayern_M%C3%BCnchen_logo_%282024%29.svg.png",
  ),
  Club(
    nama: "AC Milan",
    negara: "Italia",
    jumlahUCL: 7,
    foto:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Logo_of_AC_Milan.svg/500px-Logo_of_AC_Milan.svg.png",
  ),
  Club(
    nama: "Juventus",
    negara: "Italia",
    jumlahUCL: 2,
    foto:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Juventus_FC_-_logo_black_%28Italy%2C_2020%29.svg/250px-Juventus_FC_-_logo_black_%28Italy%2C_2020%29.svg.png",
  ),
  Club(
    nama: "Chelsea",
    negara: "Inggris",
    jumlahUCL: 2,
    foto:
        "https://upload.wikimedia.org/wikipedia/id/thumb/c/cc/Chelsea_FC.svg/250px-Chelsea_FC.svg.png?20120629075448",
  ),
  Club(
    nama: "PSG",
    negara: "Prancis",
    jumlahUCL: 1,
    foto:
        "https://upload.wikimedia.org/wikipedia/id/thumb/c/ca/Paris_Saint-Germain_F.CC..svg/330px-Paris_Saint-Germain_F.CC..svg.png?20241008083343",
  ),
  Club(
    nama: "Arsenal",
    negara: "Inggris",
    jumlahUCL: 20,
    foto:
        "https://upload.wikimedia.org/wikipedia/id/thumb/5/53/Arsenal_FC.svg/330px-Arsenal_FC.svg.png?20120629075044",
  ),
];