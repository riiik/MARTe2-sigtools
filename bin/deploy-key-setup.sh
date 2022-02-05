#!/usr/bin/env bash
echo "Host github.com-sigtools Hostname github.com IdentityFile=/keys/id_ecsda-gh-MARTe2-sigtools" >> $HOME/.ssh/config
git config --global user.name "Real User (via docker+key)"
git config --global user.email "real.user@real.domain"
