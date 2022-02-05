# Quick Start 

You want to run the applications and don't care about developing.  The quick start is with docker.

docker pull avstephen/MARTe2-sigtools
docker run -it avstephen/MARTe2-sigtools bash

You want to look at the code, but not necessarily build and run. Don't recurse over the submodules, and use the main branch.

git clone https://github.com/AdamVStephen/MARTe2-sigtools.git

You want to get the code recursively from the most stable recent release

git clone --recurse-submodules -j2 https://github.com/AdamVStephen/MARTe2-sigtools.git

You want to get the code recursively from the most stable recent develop integration

git clone -b develop --recurse-submodules -j2 https://github.com/AdamVStephen/MARTe2-sigtools.git


# Branches 

main : previous stable release
develop : current stable integration
develop-<suffix> : integration branch in progress
#NNNNN_<UserStory> : implementation of #NNNN_<UserStory>
#NNNNN_<IssueName> : implementation of #NNNN_<IssueName>
user-stories : where new ideas are incubated.  beware "git checkout user-stories --" to avoid conflict with the folder
issues : where issues are maintained (independently of github.com issues tracker)



# Workflow

Feature ideas are documented in user-stories/#NNNN_<StoryName> and implemented in branches named accordingly, then integrated as makes sense, ideally merging into develop without delay.

Issues are documented in issues/#NNNN_<IssueName> and implemented similarly.


