class Horoscope{
    final String daterange; 
    final String currentdate;
    final String description;
    final String compatibility;
    final String mood;
    final String color;
    final String luckynumber;
    final String luckytime;

Horoscope({
  this.daterange,
  this.currentdate,
  this.description,
  this.compatibility,
  this.mood,
  this.color,
  this.luckynumber,
  this.luckytime
});

factory Horoscope.fromJson(Map<String, dynamic> json){
    return Horoscope(
        daterange: json["date_range"],
        currentdate: json["current_date"],
        description: json["description"],
        compatibility: json["compatibility"],
        mood: json["mood"],
        color: json["color"],
        luckynumber: json["lucky_number"],
        luckytime: json["lucky_time"]
    );
}

}