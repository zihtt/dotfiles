#!/bin/bash
# Based on http://openweathermap.org/current

API_KEY=""

# Check on http://openweathermap.org/find
CITY_ID="588409"

ICON_SUNNY=""
ICON_CLOUDY=""
ICON_RAINY=""
ICON_STORM=""
ICON_SNOW=""
ICON_FOG=""

SYMBOL_CELSIUS="℃"

WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=metric"
WEATHER_INFO=$(curl --silent ${WEATHER_URL})
WEATHER_MAIN=$(echo ${WEATHER_INFO}|grep -o -e '\"main\":\"[a-Z]*\"'| awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo ${WEATHER_INFO}|grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_CITY=$(echo ${WEATHER_INFO}|grep -o -e '\"name\":\"[a-Z]*\"'| awk -F ':' '{print $2}' | tr -d '"')

#if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
  #echo "${ICON_SNOW} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
  #echo "${ICON_RAINY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
  #echo -e  "${ICON_CLOUDY} ${COLOR}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
  #echo "${ICON_SUNNY} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]]; then
  #echo "${ICON_FOG} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
#else
  echo "${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_CELSIUS}"
  #fi
