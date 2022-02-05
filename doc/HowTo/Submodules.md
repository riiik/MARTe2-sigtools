# Register Application Dependencies on Common Repos

git submodule add https://github.com/AdamVStephen/MARTe2.git
git submodule add https://github.com/AdamVStephen/MARTe2-components.git
git add .gitmodules
git commit -m'Registered MARTe2 and MARTe2-components submodules'
git push

# Extract Submodules as End User

Assuming that the submodules required have been merged into the default branch, you can simply

git clone --recursive

OR if using 2.13 git or later, using -j# to retrieve in parallel

git clone --recurse-submodules -j8

If you require a particular branch, or prefer to defer the recursive clone, then

git submodule init
git submodule update
