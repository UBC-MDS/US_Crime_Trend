

# Milestone 2 - Writeup

## Rationale

The purpose of this tool helps in tracking back the crime trends to civil policy makers and how they are implemented on the streets. A change in public safety policy when implemented can ripple through different aspects of actions from citizens. The measirement of crime rates gives a profound insight on the impacts of policing and civil safety policies implemented across the nation, states and down to muncipilaties.

## About the application :

The crime data from 1975 to 2015 has been collected and aggregated by the the Marshall through Uniform Crime Reporting (UCR) Program of FBI. Metrics for crimes include incidents related to Robbery, Assault, Rape and Homicide in total and per 100,000 residents. The data under for the application had:


| Features   | Description   |
|---|---|
|`department_name`   |  Jurisdiction  |
| `year`  |  Year |
| `violent_per_100k`  | Total Violent crimes and crimes per 100k residents  |
| `homs_per_100k`  | Total Homicides and homicides per 100k residents |
| `rape_per_100k`  | Total Rapes and rapes per 100k residents   |
| `rob_per_100k` |  Total robberies and robberies per 100k residents  |
|`agg_ass_per_100k`| Total assaults and assaults per 100k residents  |


## Components of the application :

The app is highly user friendly and easy to use. <br> The Front page looks like the image below and it contains following
features:

![](app_overview.PNG)

1. Year (Slider)
2. city (Drop Down)
3. Crime Type (please choose) (Radio button)

##### 1. Year Slider

![](year_slider.PNG)

A range of year can be selected from 1975 to 2015.

##### 2. city

![](city_dropdown.PNG)

User can select the city for which crime trend has to be viewed.

##### 3. Crime Type (please choose)

![](crime_type_radio.PNG)

The type of crime for a selected city and year range can be chose here.

#### Plot

![](crime_trend.PNG)

This plot shows the violent crime trend for the city of Atlanta from the 1983 - 2001 for the crime type of violent crimes per 100,000 people.


#### Next Steps :

 - We plan to bring more insights to the application based on the proportion of each crimes committed and assign a score for a specific period. 
 
 - A refined data wrangling is required to fine tune the data based on states and population
 
 - More visualizations like a heat map of various crimes for each city
