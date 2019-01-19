

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

![Usage](/figure/Usage1.PNG)

1. Year (Slider)
2. city (Drop Down)
3. Crime Type (please choose) (Radio button)

##### 1. Year Slider

![Year](/figure/Year_Slider.PNG)

The Year slider can be used to choose from 1975 to 2014 by just sliding the bar. All the
results will be displayed only for the chosen year range.

##### 2. city

![State_Selector](/figure/State_Selector_1.PNG)

The State selector can be used to choose the state for which we want to see the crime data.
Users can chose out of the shown 6 states.

##### 3. Crime Type (please choose)

![Dep_selector](/figure/Dep_Selector.PNG)

User can chose out of total 30 departments/Jurisdictions and see the crime data for specific department within that state.

#### Panel 1

![](/figure/Crime_Line_Plot.PNG)

Panel 1 shows the line plot for the selected State, Department and the year of interest. Different
crimes are shown for each of these years through different colors as shown by the legend.



#### Next Steps :

We aim to fine tune the features of the app next week. We want to display only the departments
corresponding to the chosen state in the drop down menu instead of all the departments.
