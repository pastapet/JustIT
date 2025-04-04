
def welcome(): 
    (print("Welcome to the Weather App!")
)
    
def get_name():
    return input("Enter the location you'd like to check the weather for:")

# check_weather(user_loc)

def fetch_weather(user_loc, weather_data):
    return weather_data.get(user_loc,None)

def check_weather(user_loc, weather):
    print(f"Weather forecast for {user_loc}:")
    print(f"Temperature: {weather['temperature']}")
    print(f"Conditions: {weather['conditions']}")
    print(f"Wind speed: {weather['wind_speed']}")
    print(f"Humidity: {weather['humidity']}")

def forecast():
    weather_data = {
        "London": {"temperature": "15°C", "conditions": "Cloudy", "wind_speed": "5 km/h", "humidity": "80%"}, 
        "New York": {"temperature": "20°C", "conditions": "Sunny", "wind_speed": "10 km/h", "humidity": "50%"}, 
        "Tokyo": {"temperature": "18°C", "conditions": "Rainy", "wind_speed": "7 km/h", "humidity": "90%"}, 
        "Sydney": {"temperature": "22°C", "conditions": "Windy", "wind_speed": "15 km/h", "humidity": "60%"}, 
        "Paris": {"temperature": "17°C", "conditions": "Foggy", "wind_speed": "3 km/h", "humidity": "85%"}, 
        "Kraków": {"temperature":"10°C", "conditions":"Cloudy", "wind_speed": "8 km/h", "humidity": "67%"} 
    }

    welcome()
    
    while True:
        user_loc = get_name()
        weather = fetch_weather(user_loc, weather_data)
        if weather:
            check_weather(user_loc, weather)
            break
        else:
            print(f"Sorry, we don't have weather data for '{user_loc}'. Please try again.")
    
    print("Thank you for using our weather forecast application")

if __name__ == "__main__":
    forecast()