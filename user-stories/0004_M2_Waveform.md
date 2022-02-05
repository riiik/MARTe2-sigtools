# 0004 MARTe2 Waveform Demonstrations

Use case : illustrate the use of the built-in waveform generation functionality in MARTe2.  The application should
iterate the following features :

1. Basic waveform instantiation with some variation showing the range of capability.
<<<<<<< Updated upstream
2. Capture waveform output to a csv file. Variant : capture the output for a specified time window.
3. View waveform statistics live. e.g. Compare the mean values of a sine wave and an offset sine wave, or similar predictable means.
4. View waveform value live e.g. Self refreshing web view.
5. View waveform value live as a time series plot, using something like FlotPlot in-app.
6. View waveform value live from some remote application.  Variations on the theme.
7. Use states to switch between alternate waveforms connected to the output datasources.
8. Some demonstration of live parameter changes to the waveform without restart.
9. Detailed timing on the nature of the switch over.

These will be implemented via configurations in MARTe2-demos-sigtools/Configurations/STapp-0004-Waveform-#.cfg

## Waveform-1 Basic Waveforms

This example is a minimal implementation with four Waveform objects generating sinusoids at 50Hz, 100Hz, 150Hz, 200Hz
based on a 1kHz LinuxTimer and with unit amplitude and zero offset.

Each waveform sends signals named MainsF, Mains2F, Mains3F and Mains4F to DDB1.  From there the GAMSignalsWriter
propagates all of the signals to a CSV filewriter.   A performance measurement is also written to another CSV file.

Three states are demonstrated.  In Idle and Error no data is sent to the file writers.  In Run the full application operates.

To run the application in the style of the Padua training, the invocation is

cd Startup/
./Main.sh -l RealTimeLoader -f ../Configuration/STapp-0004-Waveform-1.cfg -s Run

Using a short hand shell script in bin/

source env.centos7
./m2

=======
1.1 Implemented in commit dc611001 STapp-0004-Waveform-1.cfg
1. Capture waveform output to a csv file. Variant : capture the output for a specified time window.
1.1 Implemented in commit dc611001 STapp-0004-Waveform-1.cfg
1.1 Check whether FileWriter supports the requested time window ?
1. View waveform statistics live. e.g. Compare the mean values of a sine wave and an offset sine wave, or similar predictable means.
1. View waveform value live e.g. Self refreshing web view.
1. View waveform value live as a time series plot, using something like FlotPlot in-app.
1. View waveform value live from some remote application.  Variations on the theme.
1. Use states to switch between alternate waveforms connected to the output datasources.
1. Some demonstration of live parameter changes to the waveform without restart.
1. Detailed timing on the nature of the switch over.
>>>>>>> Stashed changes

# Implementation Notes

To check on the functionality provided by the FileDataSource::FileWriter object the documentation is found linked
from the F4E website but the detailed components documentation seems to be down.
It can be consulted from the source (it is extracted generally by Sphinx from the source code).

The StoreOnTrigger attribute looks likely to help with the requirement to collect a time windowed set of signals.
What is required to control this is a signal which when raised to 1 will trigger writing to file.  There are
options for buffer size, pre-trigger, post-trigger.  So the problem reduces to a function that produces a signal
during a time window.   This could be a custom function written fairly easily, but I will also search to see whether
a pre-existing function that can be used to achieve this is possible (aiming at relative time since start).

MathExpressionGAM permits a configuration time expression - this can easily be adopted to perform the time filtering.

NB - to check : does time change if states alter?  My belief is not.
