class ZodiacSign{
final String logo;
final String logoTitle;
final String dateRange; 
final String shortDateRange;
ZodiacSign({
  this.logo,
  this.logoTitle,
  this.dateRange,
  this.shortDateRange
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
      Zodiac(id: 1, zodiac: 'aries', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aries.png", logoTitle: "Aries", dateRange: "March 21 - April 20", shortDateRange: "Mar 21 - Apr 20")]),
      Zodiac(id: 2, zodiac: 'taurus', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/taurus.png", logoTitle: "Taurus", dateRange: "April 21 - May 21", shortDateRange: "Apr 21 - May 21")]),
      Zodiac(id: 3, zodiac: 'gemini', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/gemini.png", logoTitle: "Gemini", dateRange: "May 22 - June 21", shortDateRange: "May 22 - Jun 21")]),
      Zodiac(id: 4, zodiac: 'cancer', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/cancer.png", logoTitle: "Cancer", dateRange: "June 24 - July 23", shortDateRange: "Jun 25 - Jul 23")]),
      Zodiac(id: 5, zodiac: 'leo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/leo.png", logoTitle: "Leo", dateRange: "July 24 - August 23", shortDateRange: "Jul 24 - Aug 23")]),
      Zodiac(id: 6, zodiac: 'virgo', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/virgo.png", logoTitle: "Virgo", dateRange: "August 24 - September 23", shortDateRange: "Aug 24 - Sep 23")]),
      Zodiac(id: 7, zodiac: 'libra', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/libra.png", logoTitle: "Libra", dateRange: "September 24 - October 23", shortDateRange: "Sep 24 - Oct 23")]),
      Zodiac(id: 8, zodiac: 'scorpio', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/scorpio.png", logoTitle: "Scorpio", dateRange: "October 24 - November 22", shortDateRange: "Oct 24 - Nov 22")]),
      Zodiac(id: 9, zodiac: 'sagittarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/sagittarius.png", logoTitle: "Sagittarius", dateRange: "November 23 - December 21",shortDateRange: "Nov 23 - Dec 21")]),
      Zodiac(id: 10, zodiac: 'capricorn', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/capricorn.png", logoTitle: "Capricorn", dateRange: "December 22 - January 20", shortDateRange: "Dec 22 - Jan 20")]),
      Zodiac(id: 11, zodiac: 'aquarius', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/aquarius.png", logoTitle: "Aquarius", dateRange: "January 21 - February 19", shortDateRange: "Jan 21 - Feb 19")]),
      Zodiac(id: 12, zodiac: 'pisces', zodiacSign: [ ZodiacSign(logo: "assets/images/zodiac/pisces.png", logoTitle: "Pisces", dateRange: "February 20 - March 20", shortDateRange: "Feb 20 - Mar 20")]),
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
