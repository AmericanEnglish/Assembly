# Eventually AutoDetect Java & Git Installation Until Then
# Variables
VERSION='4_5'
# First Pull Down Mars

echo 'Creating ~/.Mars'
mkdir '${HOME}/.Mars'
echo 'Pulling Down Mars Version ${VERSION}'
wget http://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar
echo 'Moving to appropriate folder . . .'
mv 'Mars${VERSION}.jar' '${HOME}/.Mars/'
echo 'Unarchiving Jar . . .'
java -cp -xf '${HOME}/.Mars/Mars${VERSION}.jar'

# GIT THIS SON
git clone https://github.com/americanenglish/Assembly 'ScrapAssembly'
mv 'Mars.sh' '${HOME}/.Mars/mars.sh'
rm -r 'ScrapAssembly'

echo 'Setting Path Variables & Making it shell executable'
# Stuff

echo 'Restarting Shell, To Test Start IDE Using:'
echo 'mars.sh'