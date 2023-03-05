import '../models/weather_icon.dart';

const _nwsWeatherIconMap = <String, WeatherIcon>{
  'skc': WeatherIcon.clear,
  'few': WeatherIcon.fewClouds,
  'sct': WeatherIcon.partlyCloudy,
  'bkn': WeatherIcon.mostlyCloudy,
  'ovc': WeatherIcon.overcast,
  'wind_skc': WeatherIcon.clearWindy,
  'wind_few': WeatherIcon.fewCloudsWindy,
  'wind_sct': WeatherIcon.partlyCloudyWindy,
  'wind_bkn': WeatherIcon.mostlyCloudyWindy,
  'wind_ovc': WeatherIcon.overcastWindy,
  'snow': WeatherIcon.snow,
  'rain_snow': WeatherIcon.rainSnow,
  'rain_sleet': WeatherIcon.rainSleet,
  'snow_sleet': WeatherIcon.snowSleet,
  'fzra': WeatherIcon.freezingRain,
  'rain_fzra': WeatherIcon.rainFreezingRain,
  'snow_fzra': WeatherIcon.freezingRainSnow,
  'sleet': WeatherIcon.sleet,
  'rain': WeatherIcon.rain,
  'rain_showers': WeatherIcon.rainShowersHighCloudCover,
  'rain_showers_hi': WeatherIcon.rainShowersLowCloudCover,
  'tsra': WeatherIcon.thunderstormHighCloudCover,
  'tsra_sct': WeatherIcon.thunderstormMediumCloudCover,
  'tsra_hi': WeatherIcon.thunderstormLowCloudCover,
  'tornado': WeatherIcon.tornado,
  'hurricane': WeatherIcon.hurricane,
  'tropical_storm': WeatherIcon.tropicalStorm,
  'dust': WeatherIcon.dust,
  'smoke': WeatherIcon.smoke,
  'haze': WeatherIcon.haze,
  'hot': WeatherIcon.hot,
  'cold': WeatherIcon.cold,
  'blizzard': WeatherIcon.blizzard,
  'fog': WeatherIcon.fog,
};

List<WeatherIcon> decodeIcon(String icon) {
  // The URL may contain up to two icons
  final segments =
      Uri.parse(icon).pathSegments.reversed.take(2).toList().reversed;

  return segments
      // The icon segment may have a comma and number following it.
      .map((potentialIconSegment) => potentialIconSegment.split(',')[0])
      .map((potentialIcon) => _nwsWeatherIconMap[potentialIcon])
      .whereType<WeatherIcon>()
      .toList();
}
