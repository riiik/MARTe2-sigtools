#!/usr/bin/env bash
#
# Bash completion support for exercise execution utility scripts.
#
# Basic tutorial - we want to go further in due course.
#
# Ideas to implement : m2ls with completions based on MARTe2_CONFIGPATH
_ex1_completions()
{
  COMPREPLY=($(compgen -W "start stop status" "${COMP_WORDS[1]}"))
}
complete -F _ex1_completions ex1
