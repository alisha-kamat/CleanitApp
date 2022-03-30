import 'dart:math';

import 'package:cleanitapp/models/date_model.dart';
import 'package:cleanitapp/models/event_type_model.dart';
import 'package:cleanitapp/models/events_model.dart';

List<DateModel> getDates(){

  List<DateModel> dates = <DateModel>[];
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "10";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "11";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "12";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  //1
  dateModel.date = "13";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "14";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "15";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();


  //1
  dateModel.date = "16";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;

}

List<EventTypeModel> getEventTypes(){

  List<EventTypeModel> events = [];
  EventTypeModel eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/clean.webp";
  eventModel.eventType = "  Places \n to Clean";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //2
  eventModel.imgAssetPath = "assets/previous.jpg";
  eventModel.eventType = "Previous \n Projects";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //0
  eventModel.imgAssetPath = "assets/Map.png";
  eventModel.eventType = "Map";
  events.add(eventModel);

  eventModel = new EventTypeModel();


  //3
  eventModel.imgAssetPath = "assets/upload.jpg";
  eventModel.eventType = "Upload";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //4
  eventModel.imgAssetPath = "assets/donate.png";
  eventModel.eventType = "Donate";
  events.add(eventModel);

  eventModel = new EventTypeModel();
  return events;
}

List<EventsModel> getEvents(){

  List<EventsModel> events = <EventsModel>[];
  EventsModel eventsModel = new EventsModel();

  //1
  eventsModel.imgeAssetPath = "assets/dirtybeach.webp";
  eventsModel.date = "March 28, 2022";
  eventsModel.desc = "Versova Beach cleanup";
  eventsModel.address = "link to the map";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //2
  eventsModel.imgeAssetPath = "assets/dirtybeach_2.jpg";
  eventsModel.date = "May 2, 2022";
  eventsModel.desc = "Juhu beach cleanup";
      eventsModel.address = "hyperlink to map";
  events.add(eventsModel);

  eventsModel = new EventsModel();
  //2
  eventsModel.imgeAssetPath = "assets/dirtybeach_2.jpg";
  eventsModel.date = "May 2, 2022";
  eventsModel.desc = "Juhu beach cleanup";
      eventsModel.address = "hyperlink to map";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //3
  eventsModel.imgeAssetPath = "assets/dirtybeach_3.webp";
  eventsModel.date = "May 10, 2022";
  eventsModel.address = "link to map";
      eventsModel.desc = "Alibag beach cleanup";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  eventsModel.imgeAssetPath = "assets/db_4.jpeg";
  eventsModel.date = "April 17, 2022";
  eventsModel.address = "link to map";
  eventsModel.desc = "Random beach cleanup";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  return events;


}
