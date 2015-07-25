Shiny Application: Comparison of earthquake magnitude scales
============================================================

This repository contains:
- the file ui.R
- the file server.R
- a data file data.txt that provides the magnitudes of a dataset of earthquakes for different magnitude scales

The data file contains on each line:
- the duration magnitude provided by Laboratory 1 (md_L1)
- the duration magnitude provided by Laboratory 2 (md_L2)
- the duration magnitude provided by Laboratory 3 (md_L3)
- the moment magnitude (mw)
- the body wave magnitude (mb)
- the surface wave magnitude (ms)
- the local magnitude (ml)

To study a dataset of earthquakes, it is useful to have all the magnitudes of the earthquakes expressed in the same scale. However, it is not always possible because the different laboratories that record the earthquake have not always used the same magnitude scale. Therefore, it would be useful to have a formula to convert a magnitude from one scale to another.

The aim of this application is to carry out a linear regression between the magnitude expressed with one scale and the magnitude expressed with another scale, and to evaluate how reliable the regression is. You first have to select two types of scales. When you click the submit button, the application computes the linear regression model, and gives you the value of the R2 (coefficient of determination) from the linear regression and the value of the R2 computed with a bootstrap method.

On the graph, the red line is the regression model, and the circles are the data. The diameters of the circles are proportional to the number of times that rows with the same values are found in the dataset.

You can learn more about the different magnitude scales on Wikipedia:
- [Duration magnitude](https://en.wikipedia.org/wiki/Earthquake_duration_magnitude)
- [Moment magnitude](https://en.wikipedia.org/wiki/Moment_magnitude_scale)
- [Body wave magnitude](https://en.wikipedia.org/wiki/Body_wave_magnitude)
- [Surface wave magnitude](https://en.wikipedia.org/wiki/Surface_wave_magnitude)
- [Local magnitude](https://en.wikipedia.org/wiki/Richter_magnitude_scale)
