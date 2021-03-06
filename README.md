# model-neuron-pop1

MATLAB exercise: Simple Population Code 2, from Greg DeAngelis

Following instructions found in Overall_Task.txt

Overall task: you are going to create a model population of neurons that are tuned for depth (really, the variable here is
arbitrary but lets call it depth), generate random Poisson draws of population activity, and use a linear decoder to classify
depth as near vs far in a simulated depth discrimination task.

1) Create a Gaussian depth tuning curve with a preferred (peak) depth of zero degrees.  Your depth axis (x-axis) should range
from -2 deg to +2deg.  Choose the parameters of the Gaussian function such that your curve has the following properties: a
peak response of 50 spikes/sec,  a tuning width (full width at half-maximal amplitude) of 0.2 deg, and a minimum (baseline)
response of 5 spikes/sec. Make a plot of the tuning curve that shows response as a function of depth.

2) Next, generalize your code such that you create depth tuning curves for a population of 100 neurons.  The preferred depths
of your 100 neurons should be uniformly distributed between -2 deg and +2 deg.  Otherwise, the tuning curves can be identical
in other respects.  Make a plot of the set of tuning curves for your 100 neurons.

3) Now, you are going to generate a population response of the 100 units for a specific depth stimulus.  For a depth value of
-0.1 deg, generate a random firing rate for each neuron from a Poisson distribution ("poissrnd" function in Matlab).  Make a
plot of the population response for this depth value.  This plot should show the activity of each neuron plotted as a function
of the preferred depth of each neuron.

4) Now do the same thing for a depth value of +0.1 deg.  Plot this population response on the same graph as in the step above,
but using a different color.  Now you should have a graph that shows a simulated population response for the two depth
values.

5) Next, you are going to generate population response data that you will use to train and test a linear classifier.  For this
purpose, generate random population responses as above by drawing random Poisson deviates for each neuron for depths of -0.1
and +0.1 deg.  Generate 500 random population responses for each depth value, and store these in matrices.  You will use 80%
of the data (400 simulated trials for each depth) to train your linear classifier and the remaining 20% of the data to test
the performance of your classifier.

6)  Use the matlab "classify" function (there are other, better versions  but this one is simplest to use) to train and test a
linear classifier on your data.  The classifier output for the 20% of "test" trials will be what you use to evaluate the
performance of your classifier.  You can compute the % correct of your classifier from the classifier outputs on the test
trials.

7) Now, repeat the generation of population responses and training of the classifier for other pairs of depth values.  
In addition to the +/- 0.1 deg values that you already used above, evaluate the performance of your classifier for the
following additional pairs of depth values:  +/- 0.01, 0.05, 0.2, and 0.5 degrees.  Plot the percentage correct of your
classifier as a function of the magnitude of the depth values discriminated.  This should produce a plot that has % correct on
the y-axis and depth values of 0.01, 0.05, 0.1, 0.2, and 0.5 on the x-axis.
