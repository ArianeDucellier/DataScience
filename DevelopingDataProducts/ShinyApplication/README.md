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

To study a dataset of earthquakes, it is useful to have all the magnitudes expressed in the same scale. However, it is not always possible because the different laboratories that record the earthquake have not always used the same magnitude scale. Therefore, it would be useful to have a formula to convert a magnitude from one scale to another.

The aim of this application is to carry out a linear regression between the magnitude expressed with one scale and the magnitude expressed with another scale, and to evaluate how reliable the regression is. You first have to select two types of scales. You can also select a formula from the scientific litterature, to compare with the results of your regression. On the main panel, you will see a graph illustrating the linear regression.

You can learn more about the different magnitude scales on Wikipedia:
- [Duration magnitude](https://en.wikipedia.org/wiki/Earthquake_duration_magnitude)
- [Moment magnitude](https://en.wikipedia.org/wiki/Moment_magnitude_scale)
- [Body wave magnitude](https://en.wikipedia.org/wiki/Body_wave_magnitude)
- [Surface wave magnitude](https://en.wikipedia.org/wiki/Surface_wave_magnitude)
- [Local magnitude](https://en.wikipedia.org/wiki/Richter_magnitude_scale)
