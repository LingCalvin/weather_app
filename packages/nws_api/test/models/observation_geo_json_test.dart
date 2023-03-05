import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  group('ObservationGeoJson', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          '@context': [
            'https://geojson.org/geojson-ld/geojson-context.jsonld',
            {
              '@version': '1.1',
              'wx': 'https://api.weather.gov/ontology#',
              's': 'https://schema.org/',
              'geo': 'http://www.opengis.net/ont/geosparql#',
              'unit': 'http://codes.wmo.int/common/unit/',
              '@vocab': 'https://api.weather.gov/ontology#',
              'geometry': {
                '@id': 's:GeoCoordinates',
                '@type': 'geo:wktLiteral'
              },
              'city': 's:addressLocality',
              'state': 's:addressRegion',
              'distance': {'@id': 's:Distance', '@type': 's:QuantitativeValue'},
              'bearing': {'@type': 's:QuantitativeValue'},
              'value': {'@id': 's:value'},
              'unitCode': {'@id': 's:unitCode', '@type': '@id'},
              'forecastOffice': {'@type': '@id'},
              'forecastGridData': {'@type': '@id'},
              'publicZone': {'@type': '@id'},
              'county': {'@type': '@id'}
            }
          ],
          'id':
              'https://api.weather.gov/stations/KNYC/observations/2023-03-04T22:19:00+00:00',
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [-73.98, 40.77]
          },
          'properties': {
            '@id':
                'https://api.weather.gov/stations/KNYC/observations/2023-03-04T22:19:00+00:00',
            '@type': 'wx:ObservationStation',
            'elevation': {'unitCode': 'wmoUnit:m', 'value': 27},
            'station': 'https://api.weather.gov/stations/KNYC',
            'timestamp': '2023-03-04T22:19:00+00:00',
            'rawMessage':
                r'KNYC 042219Z AUTO 10SM SCT025 BKN032 BKN049 06/01 A2981 RMK AO2 T00610011 $',
            'textDescription': 'Mostly Cloudy',
            'icon': 'https://api.weather.gov/icons/land/day/bkn?size=medium',
            'presentWeather': [],
            'temperature': {
              'unitCode': 'wmoUnit:degC',
              'value': 6.1,
              'qualityControl': 'S'
            },
            'dewpoint': {
              'unitCode': 'wmoUnit:degC',
              'value': 1.1,
              'qualityControl': 'S'
            },
            'windDirection': {
              'unitCode': 'wmoUnit:degree_(angle)',
              'value': null,
              'qualityControl': 'Z'
            },
            'windSpeed': {
              'unitCode': 'wmoUnit:km_h-1',
              'value': null,
              'qualityControl': 'Z'
            },
            'windGust': {
              'unitCode': 'wmoUnit:km_h-1',
              'value': null,
              'qualityControl': 'Z'
            },
            'barometricPressure': {
              'unitCode': 'wmoUnit:Pa',
              'value': 100950,
              'qualityControl': 'S'
            },
            'seaLevelPressure': {
              'unitCode': 'wmoUnit:Pa',
              'value': null,
              'qualityControl': 'Z'
            },
            'visibility': {
              'unitCode': 'wmoUnit:m',
              'value': 16090,
              'qualityControl': 'C'
            },
            'maxTemperatureLast24Hours': {
              'unitCode': 'wmoUnit:degC',
              'value': null
            },
            'minTemperatureLast24Hours': {
              'unitCode': 'wmoUnit:degC',
              'value': null
            },
            'precipitationLastHour': {
              'unitCode': 'wmoUnit:mm',
              'value': null,
              'qualityControl': 'Z'
            },
            'precipitationLast3Hours': {
              'unitCode': 'wmoUnit:mm',
              'value': null,
              'qualityControl': 'Z'
            },
            'precipitationLast6Hours': {
              'unitCode': 'wmoUnit:mm',
              'value': null,
              'qualityControl': 'Z'
            },
            'relativeHumidity': {
              'unitCode': 'wmoUnit:percent',
              'value': 70.319357088131,
              'qualityControl': 'S'
            },
            'windChill': {
              'unitCode': 'wmoUnit:degC',
              'value': null,
              'qualityControl': 'S'
            },
            'heatIndex': {
              'unitCode': 'wmoUnit:degC',
              'value': null,
              'qualityControl': 'S'
            },
            'cloudLayers': [
              {
                'base': {'unitCode': 'wmoUnit:m', 'value': 760},
                'amount': 'SCT'
              },
              {
                'base': {'unitCode': 'wmoUnit:m', 'value': 980},
                'amount': 'BKN'
              },
              {
                'base': {'unitCode': 'wmoUnit:m', 'value': 1490},
                'amount': 'BKN'
              }
            ]
          }
        };

        expect(
          ObservationGeoJson.fromJson(json),
          isA<ObservationGeoJson>()
              .having((obj) => obj.id, 'id', json['id'])
              .having((obj) => obj.type, 'type', GeoJsonFeatureType.feature)
              .having((obj) => obj.geometry, 'geometry', isA<GeoJsonGeometry>())
              .having(
                (obj) => obj.properties,
                'properties',
                isA<Observation>(),
              ),
        );
      });
    });
  });

  group('Observation', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          'geometry': 'string',
          '@id': 'string',
          '@type': 'wx:ObservationStation',
          'elevation': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'station': 'string',
          'timestamp': '2023-03-04T22:45:39.874Z',
          'rawMessage': 'string',
          'textDescription': 'string',
          'presentWeather': [
            {
              'intensity': 'light',
              'modifier': 'patches',
              'weather': 'fog_mist',
              'rawString': 'string',
              'inVicinity': true
            }
          ],
          'temperature': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'dewpoint': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'windDirection': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'windSpeed': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'windGust': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'barometricPressure': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'seaLevelPressure': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'visibility': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'maxTemperatureLast24Hours': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'minTemperatureLast24Hours': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'precipitationLastHour': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'precipitationLast3Hours': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'precipitationLast6Hours': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'relativeHumidity': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'windChill': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'heatIndex': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'cloudLayers': [
            {
              'base': {
                'value': 0,
                'maxValue': 0,
                'minValue': 0,
                'unitCode': 'string',
                'qualityControl': 'Z'
              },
              'amount': 'OVC'
            }
          ]
        };

        expect(
          Observation.fromJson(json),
          isA<Observation>()
              .having((obj) => obj.atId, 'atId', json['@id'])
              .having(
                (obj) => obj.atType,
                'atType',
                ObservationStationType.wxObservationStation,
              )
              .having(
                (obj) => obj.barometricPressure,
                'barometricPressure',
                isA<QuantitativeValue>(),
              )
              .having((obj) => obj.cloudLayers, 'cloudLayers', hasLength(1))
              .having(
                (obj) => obj.dewpoint,
                'dewpoint',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.elevation,
                'elevation',
                isA<QuantitativeValue>(),
              )
              .having((obj) => obj.geometry, 'geometry', json['geometry'])
              .having(
                (obj) => obj.heatIndex,
                'heatIndex',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.maxTemperatureLast24Hours,
                'maxTemperatureLast24Hours',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.minTemperatureLast24Hours,
                'minTemperatureLast24Hours',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.precipitationLast3Hours,
                'precipitationLast3Hours',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.precipitationLast6Hours,
                'precipitationLast6Hours',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.precipitationLastHour,
                'precipitationLastHour',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.presentWeather,
                'presentWeather',
                hasLength(1),
              )
              .having((obj) => obj.rawMessage, 'rawMessage', json['rawMessage'])
              .having(
                (obj) => obj.relativeHumidity,
                'relativeHumidity',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.seaLevelPressure,
                'seaLevelPressure',
                isA<QuantitativeValue>(),
              )
              .having((obj) => obj.station, 'station', json['station'])
              .having(
                (obj) => obj.temperature,
                'temperature',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.textDescription,
                'textDescription',
                json['textDescription'],
              )
              .having(
                (obj) => obj.timestamp,
                'timestamp',
                DateTime.parse(json['timestamp'] as String),
              )
              .having(
                (obj) => obj.visibility,
                'visibility',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.windChill,
                'windChill',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.windDirection,
                'windDirection',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.windGust,
                'windGust',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.windSpeed,
                'windSpeed',
                isA<QuantitativeValue>(),
              ),
        );
      });
    });
  });

  group('MetarPhenomenon', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          'intensity': 'light',
          'modifier': 'patches',
          'weather': 'fog_mist',
          'rawString': 'string',
          'inVicinity': true
        };

        expect(
          MetarPhenomenon.fromJson(json),
          isA<MetarPhenomenon>()
              .having((obj) => obj.inVicinity, 'inVicinity', json['inVicinity'])
              .having(
                (obj) => obj.intensity,
                'intensity',
                MetarPhenomenonIntensity.light,
              )
              .having(
                (obj) => obj.modifier,
                'modifier',
                MetarPhenomenonModifier.patches,
              )
              .having((obj) => obj.rawString, 'rawString', json['rawString'])
              .having(
                (obj) => obj.weather,
                'weather',
                MetarPhenomenonWeather.fogMist,
              ),
        );
      });
    });
  });

  group('MetarPhenomenonIntensity', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['light', MetarPhenomenonIntensity.light],
        ['heavy', MetarPhenomenonIntensity.heavy],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            MetarPhenomenonIntensity.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => MetarPhenomenonIntensity.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });

  group('MetarPhenomenonModifier', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['patches', MetarPhenomenonModifier.patches],
        ['blowing', MetarPhenomenonModifier.blowing],
        ['low_drifting', MetarPhenomenonModifier.lowDrifting],
        ['freezing', MetarPhenomenonModifier.freezing],
        ['shallow', MetarPhenomenonModifier.shallow],
        ['partial', MetarPhenomenonModifier.partial],
        ['showers', MetarPhenomenonModifier.showers],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            MetarPhenomenonModifier.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => MetarPhenomenonModifier.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });

  group('MetarPhenomenonWeather', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['fog_mist', MetarPhenomenonWeather.fogMist],
        ['dust_storm', MetarPhenomenonWeather.dustStorm],
        ['dust', MetarPhenomenonWeather.dust],
        ['drizzle', MetarPhenomenonWeather.drizzle],
        ['funnel_cloud', MetarPhenomenonWeather.funnelCloud],
        ['fog', MetarPhenomenonWeather.fog],
        ['smoke', MetarPhenomenonWeather.smoke],
        ['hail', MetarPhenomenonWeather.hail],
        ['snow_pellets', MetarPhenomenonWeather.snowPellets],
        ['haze', MetarPhenomenonWeather.haze],
        ['ice_crystals', MetarPhenomenonWeather.iceCrystals],
        ['ice_pellets', MetarPhenomenonWeather.icePellets],
        ['dust_whirls', MetarPhenomenonWeather.dustWhirls],
        ['spray', MetarPhenomenonWeather.spray],
        ['rain', MetarPhenomenonWeather.rain],
        ['sand', MetarPhenomenonWeather.sand],
        ['snow_grains', MetarPhenomenonWeather.snowGrains],
        ['snow', MetarPhenomenonWeather.snow],
        ['squalls', MetarPhenomenonWeather.squalls],
        ['sand_storm', MetarPhenomenonWeather.sandStorm],
        ['thunderstorms', MetarPhenomenonWeather.thunderstorms],
        ['unknown', MetarPhenomenonWeather.unknown],
        ['volcanic_ash', MetarPhenomenonWeather.volcanicAsh],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            MetarPhenomenonWeather.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => MetarPhenomenonWeather.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });

  group('ObservationCloudLayer', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          'base': {
            'value': 0,
            'maxValue': 0,
            'minValue': 0,
            'unitCode': 'string',
            'qualityControl': 'Z'
          },
          'amount': 'OVC',
        };

        expect(
          ObservationCloudLayer.fromJson(json),
          isA<ObservationCloudLayer>()
              .having((obj) => obj.amount, 'amount', MetarSkyCoverage.ovc)
              .having((obj) => obj.base, 'base', isA<QuantitativeValue>()),
        );
      });
    });
  });

  group('MetarSkyCoverage', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['OVC', MetarSkyCoverage.ovc],
        ['BKN', MetarSkyCoverage.bkn],
        ['SCT', MetarSkyCoverage.sct],
        ['FEW', MetarSkyCoverage.few],
        ['SKC', MetarSkyCoverage.skc],
        ['CLR', MetarSkyCoverage.clr],
        ['VV', MetarSkyCoverage.vv],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            MetarSkyCoverage.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => MetarSkyCoverage.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
}
