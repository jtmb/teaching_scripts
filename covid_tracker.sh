#!/bin/bash

# Clears console
    clear

# Prints message in console

    echo
    echo Fetching and Loading Results...

# Collected geoIP information

        #The Scripts make API calls to to get results based on IP address, writes to variables.

            #location
                location=$(curl -s https://freegeoip.app/json/ | jq -r ".country_name")
            #Ip Address
                ip=$(curl -s https://ip-fast.com/api/ip/)
            #City
                city=$(curl -s https://freegeoip.app/json/ | jq -r ".city")
            #Zip/Postal
                postal=$(curl -s https://freegeoip.app/json/ | jq -r ".zip_code")   
            #Region Name
                region=$(curl -s https://freegeoip.app/json/ | jq -r ".region_name")
            #Region Code
                region_code=$(curl -s https://freegeoip.app/json/ | jq -r ".region_code")
            #Region Code
                tz=$(curl -s https://freegeoip.app/json/ | jq -r ".time_zone")
            # yesterdays_date
                ydate=$(date --date="-1 day" +%Y-%m-%d)
            # todays_date
                tdate=$(date +%Y-%m-%d)
            # Date 1 week
                wdate=$(date --date="-7 day" +%Y-%m-%d)
    
    #covid cases for today
        

# Covid cases compared weekly new confirmed (geoIP)

        # The Scripts make API calls to to get results based on the '$location' VAR we collected in step 1 address, writes to variables.

            newconfirmed=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("'$location'"))' | jq .NewConfirmed)
            newdeaths=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("'$location'"))' | jq .NewDeaths)
            totaldeaths=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("'$location'"))' | jq .TotalDeaths)
            cases=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("'$location'"))' | jq .TotalConfirmed)


# Covid cases compared weekly new confirmed (Portugal)
        
        # Same as above but with static API calls not using VARs (for example)

            pnewconfirmed=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("Portugal"))' | jq .NewConfirmed)
            pnewdeaths=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("Portugal"))' | jq .NewDeaths)
            ptotaldeaths=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("Portugal"))' | jq .TotalDeaths)
            pcases=$(curl -s --location --request GET 'https://api.covid19api.com/summary'| jq '.Countries[] | select(.Country | contains("Portugal"))' | jq .TotalConfirmed)


# Variable Outputs 

    echo
    echo
    echo
    echo -e "    [WHOAMI]" 
    echo
    echo -e "    IP Address: $ip"
    echo -e "    Country: $location"
    echo -e "    Region: $region"
    echo -e "    Region Code: $region_code"
    echo -e "    City: $city"
    echo -e "    Zip/Postal: $postal"
    echo -e "    Time Zone: $tz"
    echo -e "    Date: $tdate"
    echo
    echo ---------------------------------------------------------
    echo
    echo -e "    [COVID19 Cases in $location]"
    echo
    echo -e "    Total Cases: $cases"
    echo -e "    Total New Cases: $newconfirmed"
    echo -e "    Total New Deaths: $newdeaths"
    echo -e "    Total Deaths: $totaldeaths"
    echo -e "    Updated: $tdate" 
    echo
    echo ---------------------------------------------------------
    echo
    echo -e "    [COVID19 Cases in Portugal]"
    echo
    echo -e "    Total Cases: $pcases"
    echo -e "    Total New Cases: $pnewconfirmed"
    echo -e "    Total New Deaths: $pnewdeaths"
    echo -e "    Total Deaths: $ptotaldeaths"
    echo -e "    Updated: $tdate" 
    echo
    echo ---------------------------------------------------------
    echo




    $SHELL