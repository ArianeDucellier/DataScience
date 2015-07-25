Comparison of earthquake magnitude scales
=========================================

First, we have a look at the data file. It contains seven columns:
- the duration magnitude provided by Laboratory 1 (md_L1)
- the duration magnitude provided by Laboratory 2 (md_L2)
- the duration magnitude provided by Laboratory 3 (md_L3)
- the moment magnitude (mw)
- the body wave magnitude (mb)
- the surface wave magnitude (ms)
- the local magnitude (ml)
We also look at the number of data available for each couple of two magnitude scales.

To study a dataset of earthquakes, it is useful to have all the magnitudes of the earthquakes expressed in the same scale. However, it is not always possible because the different laboratories that record the earthquake have not always used the same magnitude scale. Therefore, it would be useful to have a formula to convert a magnitude from one scale to another. For example, we carry out a linear regression between the surface wave magnitude and the moment magnitude, and we compute the value of the R2 (coefficient of determination).

In order to evaluate how reliable the linear model is, we compute the value of the R2 with a bootstrap method.

On the graph, the red line is the regression model, and the circles are the data. The diameters of the circles are proportional to the number of times that rows with the same values are found in the dataset.

You can learn more about the different magnitude scales on Wikipedia:
- [Duration magnitude](https://en.wikipedia.org/wiki/Earthquake_duration_magnitude)
- [Moment magnitude](https://en.wikipedia.org/wiki/Moment_magnitude_scale)
- [Body wave magnitude](https://en.wikipedia.org/wiki/Body_wave_magnitude)
- [Surface wave magnitude](https://en.wikipedia.org/wiki/Surface_wave_magnitude)
- [Local magnitude](https://en.wikipedia.org/wiki/Richter_magnitude_scale)
