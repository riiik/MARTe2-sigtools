# Exercises

# TODO

1. Break up this documentation to allow quickstart if using a docker.
2. Add an option to the install script to infer and build MARTe automatically
3. Add a diagram.
4. You have a brand new machine (real or docker)
5. You have a machine with MARTe installed but not EPICS etc.
6. You have a machine with MARTe, EPICS, ... - standard MARTe development profile.
7. You are using a pre-built docker.
8. You are running everything in the pre-built web hosted environment (WIBNI)

9. Break up the script to not be so monolithic.  This then avoids the need to reuse
the same script for several purposes, and the documentation will become simpler.


10. Write some bash autocompletion stuff.
11. Package this in debian and rpm so it just works.
12.

# Environment and Installation

Note the assumptions about installation, paths and heuristics to make life easier
as long as you understand the assumptions.

The standard expected workflow on a machine without the system installed (first time install).

1. git clone https://github.com/AdamVStephen/my-dockers
2. cd my-dockers/MARTe2-sigtools
3. Using the correct script for your DISTRO (centos7 or debian at present)
3.1 Install any dependencies required *As root* : ./marte2-sigtools-<DISTRO>-install.sh
3.2 Install the MARTe2-sigtools and submodules dependencies required  : ./marte2-sigtools-<DISTRO>-install.sh
3.3 At present, use the hints in the script to build the MARTe2-dev and MARTe2-components elements.

## Assumptions

The install script sets a number of environment variables which dictate where the software packages will be installed.

- Dependencies from the root install phase go where the package manager puts them.
- EPICS, OPCUA, MDSPLUS, SDN, OPEN62541 are installed under MARTe2_Sigtools_PROJECTS_ROOT

Clearly to install MARTe2-sigtools on a machine that already has the MARTe software, a simpler approach is possible. 

To make it possible to do everything without cloning the MARTe2-sigtools repository first, the script is maintained
in the my-dockers repository.  This needs to be cleaned up.

# Utilities

- bin/marte2-<DISTRO>.sh setenv script : source and if working repeatedly, add to your .bashrc
- recommended aliases make cli navigation simpler
- bin/m2 top level bash executor to minimise command line typing
- ./m2 <ConfigFile.cfg> : will start MARTe with default -l RealTimeLoader -s Run

# Waveform

## Waveform Generator to CSV

- File STapp-0004-Waveform-3.cfg

- Graph

- Summary
-- Builds on example 1 with the 4 waveforms, 2 file writers.
-- App contains the same three states, each with one thread apply.
-- New top level EPICS CA interface is added to give external control.
-- New top level webserver component is added to give external visibility.
-- New top level state machine which links the interfaces to the states.
-- State selected indirectly from the startup script using the message interface.
-- Note No LoggerData source so after startup messages, nothing on console.

- Execute Protocol
-- ./m2 STapp-0004-Waveform-3.cfg -m StateMachine:START
-- START message triggers the RPC call of "Start" functions in HttpServer / EPICS interface.
-- START message triggers the state StateMchine to command TestApp to Idle state
-- The webserver exposes commands to change the TestApp between the three states.

- Docker Environment

- Learning Point
-- What happens to the contents of the data file as the states are manipulated ?
 
- Hints/Solution
-- Application starts in IDLE which computes waveform values, but doesn't write to file.
-- Time clocks up in microseconds
-- Pushing the state to Run at 260s shows the /var/tmp files being opened
-- The initial data is indeed timestamped as 260s
-- Line count of the files is increasing at about 1kHz, 0.1M every 2 seconds.
-- Pushing the state back to Idle shows the number of lines stabilised at 114680
-- At this stage, the timestamp of the last line is 381091000
-- Back to Run : application goes into error state,
-- Hypothesis : the error is due to the absence of a partner EPICS IOC application
-- From the error state, we need the IOC in order to perform a reset

- EPICS IOC
-- As described in the Padova 2019 training
-- softIoc -d EPICSv3-demo.db
-- caput MARTE2-DEMO-APP:COMMAND 0
-- caget MARTE2-DEMO-APP:STATUS
-- caput MARTE2-DEMO-APP:COMMAND 1 && sleep 2
-- caget MARTE2-DEMO-APP:STATUS && sleep 5
-- caput MARTE2-DEMO-APP:COMMAND 0
--
-- camonitor is another option

- Plotting for RTApp-EPICSv3-1.csv
-- Octave
-- graphics_toolkit('gnuplot')
-- load('/tmp/File.csv')
-- plot(File(:,1),File(:,2), File(:1), File(:,6)
-- legend('Reference0', 'Measurement0')





- Screenshot
[NoError - StateMachine.cpp:239]: In state (RUN) could not send all the event messages. Moving to error state (ERROR)
[Information - StateMachine.cpp:340]: In state (ERROR) triggered message (SetStatusPV)
[FatalError - EPICSPV.cpp:355]: ca_put failed for PV: MARTE2-DEMO-APP:STATUS
[Warning - QueuedReplyMessageCatcherFilter.cpp:72]: The message caught is not a reply GOTORUN
[Warning - QueuedReplyMessageCatcherFilter.cpp:72]: The message caught is not a reply GOTORUN
[Warning - QueuedReplyMessageCatcherFilter.cpp:72]: The message caught is not a reply GOTORUN



## Waveform Generator to CSV

- File STapp-0004-Waveform-1.cfg

- Graph

- Summary
-- 50Hz Sine and three harmonics.
-- FileWriters for the signal data and performance metrics
-- IOGAMs to map the signals to file from GAM and 
-- Three States : each with a single thread.
--- Idle: just the timer and waveforms
--- Run: both file writers as well
--- Error: just the timer
-- State selected by startup.
-- Thread directed to CPU 4.
-- Default Scheduler and Timings data source.
-- Note : No LoggerData source so after startup messages, nothing on console.
-- Note : No webserver interface : bare bones application.

- Execute Protocol
-- 

- Screenshot


## wavef 


## Maintainer Notes

Please adhere to the following expectations

1. Use shellcheck to lint shell scripts in the project.
2. Ensure that the instructions work with the following supported platforms:
2.1 x86_64 centos7 on a real machine
2.2 x86_64 centos7 on docker installed by the docker user from base reference
2.3 x86_64 centos7 on docker created by Dockerfile
3.1 x86_64 debian 11 on a real machine
3.2 x86_64 debian 11 on docker installed by the docker user from base reference
3.3 x86_64 debian 11 on docker created by Dockerfile

Additional platforms will be added in due course and some CI to check execution developed.

## QA

Note in passing the difference between providing 5 simple MARTe2 example configuration files
which ought to run with any reasonably stable MARTe2 installation, and providing a fully
featured, supported, documented, tested and easy to use environment with which to carry
out the setup.


