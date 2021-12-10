#simple IP crawler shell script

# clears console
    clear

# welcome message
    echo
    echo
    echo --------------------------------------------------------------------------------------
    echo
    echo Welcome to the simple test script crawler. This crawler was made for test purposes only.
    echo
    echo -------------------------------------------------------------------------------------- 
    echo
    echo

# User Input
        # Collects User Manual Info, writes to variable
    #first name
        echo What is your first name?
        read -s first
    #last name
        echo What is your last name?
        read -s last
    #age
        echo What is your age?
        read -s age
    #email Address
        echo What is your postal email address?
        read -s email


# Collected information
        #The Script makes API calls to to get results based on IP address, writes to variables.
    #location
        location=$(curl -s https://freegeoip.app/json/ | jq -r ".country_name")
    #Ip Address
        ip=$(curl https://ip-fast.com/api/ip/)
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


# clears console
    clear

# Display Output confirmation request
    while true; do
        read -p "Do you have want to display output?" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit ;;
            * ) echo "Please answer yes or no.";;
        esac
    done

# clears console
    clear

# Display output from generated variables
    echo
    echo --------------------
    echo Here is the info you gave me:
    echo
    echo First Name: $first
    echo Last Name: $last
    echo Age: $age
    echo Email Address: $email
    echo
    echo Here is the info i collected:
    echo
    echo IP Address: $ip
    echo Country: $location
    echo Region: $region
    echo Region Code: $region_code
    echo City: $city
    echo Zip/Postal: $postal
    echo Time Zone: $tz
    echo 
    echo --------------------
    echo
    echo