# Git Tasks

Some of the tasks I find I have to carry out just sufficiently infrequently that I forget the incantations.

For the most useful, I will add them to my git aliases definitions which I share at
https://github.com/AdamVStephen/my-git-aliases


## Existence of a File (in any branch)

Aliases gff (git find file) and gffc (git find file with copies) taken from Juan Antonio Tubio on SO.

## Most Recent Commit Providing File

The underlying git commands for the aliases above prior to their filters can help find this, but 
I have not yet scripted the solution so it's a manual

git log --name-status --all -M -B | less

## Branch Containing Commit

This one is almost plain English for a change:

git branch --contains <SHA>

## Checkout Specific Directory from Commit

In order to manually merge files from another commit to the working directory


# Stackoverflow (SO) References

The reminders above were culled from the following collection of stackoverflow.com discussions, with the usual
kudos and thanks to the authors.

1. https://stackoverflow.com/questions/543346/list-all-the-files-that-ever-existed-in-a-git-repository/543383#543383
