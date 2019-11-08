class ZodiacSign{
final String logo;
final String logoTitle;
final String dateRange; 

ZodiacSign({
  this.logo,
  this.logoTitle,
  this.dateRange
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
      Zodiac(id: 1, zodiac: 'aries', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aries.png", logoTitle: "Aries", dateRange: "March 21 - April 20")]),
      Zodiac(id: 2, zodiac: 'taurus', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/taurus.png", logoTitle: "Taurus", dateRange: "April 21 - May 21")]),
      Zodiac(id: 3, zodiac: 'gemini', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/gemini.png", logoTitle: "Gemini", dateRange: "May 22 - June 21")]),
      Zodiac(id: 4, zodiac: 'cancer', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/cancer.png", logoTitle: "Cancer", dateRange: "June 24 - July 23")]),
      Zodiac(id: 5, zodiac: 'leo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/leo.png", logoTitle: "Leo", dateRange: "July 24 - August 23")]),
      Zodiac(id: 6, zodiac: 'virgo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/virgo.png", logoTitle: "Virgo", dateRange: "August 24 - September 23")]),
      Zodiac(id: 7, zodiac: 'libra', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/libra.png", logoTitle: "Libra", dateRange: "September 24 - October 23")]),
      Zodiac(id: 8, zodiac: 'scorpio', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/scorpio.png", logoTitle: "Scorpio", dateRange: "October 24 - November 22")]),
      Zodiac(id: 9, zodiac: 'sagittarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/sagittarius.png", logoTitle: "Sagittarius", dateRange: "November 23 - December 21")]),
      Zodiac(id: 10, zodiac: 'capricorn', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/capricorn.png", logoTitle: "Capricorn", dateRange: "December 22 - January 20")]),
      Zodiac(id: 11, zodiac: 'aquarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aquarius.png", logoTitle: "Aquarius", dateRange: "January 21 - February 19")]),
      Zodiac(id: 12, zodiac: 'pisces', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/pisces.png", logoTitle: "Pisces", dateRange: "February 20 - March 20")]),
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
