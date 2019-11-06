class ZodiacSign{
final String logo;
final String logoTitle;
ZodiacSign({
  this.logo,
  this.logoTitle
});
}


class Zodiac {
  final List<ZodiacSign> zodiacSign;
  final int id;
  final String zodiac;

  Zodiac({
    this.id,
    this.zodiac,
    this.zodiacSign
  });

  static List<Zodiac> fetchAll(){
    return [
      Zodiac(id: 1, zodiac: 'aries', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aries.png", logoTitle: "Aries")]),
      Zodiac(id: 2, zodiac: 'taurus', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/taurus.png", logoTitle: "Taurus")]),
      Zodiac(id: 3, zodiac: 'gemini', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/gemini.png", logoTitle: "Gemini")]),
      Zodiac(id: 4, zodiac: 'cancer', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/cancer.png", logoTitle: "Cancer")]),
      Zodiac(id: 5, zodiac: 'leo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/leo.png", logoTitle: "Leo")]),
      Zodiac(id: 6, zodiac: 'virgo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/virgo.png", logoTitle: "Virgo")]),
      Zodiac(id: 7, zodiac: 'libra', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/libra.png", logoTitle: "Libra")]),
      Zodiac(id: 8, zodiac: 'scorpio', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/scorpio.png", logoTitle: "Scorpio")]),
      Zodiac(id: 9, zodiac: 'sagittarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/sagittarius.png", logoTitle: "Sagittarius")]),
      Zodiac(id: 10, zodiac: 'capricorn', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/capricorn.png", logoTitle: "Capricorn")]),
      Zodiac(id: 11, zodiac: 'aquarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aquarius.png", logoTitle: "Aquarius")]),
      Zodiac(id: 12, zodiac: 'pisces', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/pisces.png", logoTitle: "Pisces")]),
    ];
  }


  static Zodiac fetchByID(int zodiacID){
    List<Zodiac> zodiac = Zodiac.fetchAll();
    for(var i = 0; i<zodiac.length; i++){
      if(zodiac[i].id == zodiacID){
        return zodiac[i];
      }
    }
    return null;
  }

}
