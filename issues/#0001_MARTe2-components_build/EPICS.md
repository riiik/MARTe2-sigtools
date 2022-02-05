# EPICS Datasource Build Issues

Similar issue to the OPCUA issue in this directory.

Using the develop branch of MARTe2-components at commit 5fc9cfd8 (Jan 14 2022).

Using version 7.0.2 of EPICS

Using centos:centos7 latest image from docker hub.

Using the build recipe in the Padua 2019 instructions.

Build errors to do with the location of first cadef.h (if fixed then with epicsThread.h)...

Comparison with the reference docker image avstephen/m2padova:asti

1. MARTe2-components branch is develop but commit is 00a08ac Jun 14 2019

So - assume that epics-7.0.2 was compatible with the 2019 branch, but the 2022 branch not so much.

The other workaround of course is to drop back explicitly to the same versions of MARTe2 and MARTe2-components.
