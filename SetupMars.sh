# Eventually AutoDetect Java & Git Installation Until Then
# Variables
VERSION='4_5'
# First Pull Down Mars

echo 'Creating ~/.Mars'
mkdir "${HOME}/.Mars"

echo "Pulling Down Mars Version ${VERSION}"
wget http://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar

echo 'Moving to appropriate folder . . .'
mv "./Mars${VERSION}.jar" "$HOME/.Mars/Mars${VERSION}.jar"

echo 'Unarchiving Jar . . .'
unzip "${HOME}/.Mars/Mars${VERSION}.jar" -d "${HOME}/.Mars/"

# GIT THIS SON
echo 'Pulling Script For mars . . .'
git clone https://github.com/americanenglish/Assembly 'ScrapAssembly'
echo 'Moving Script . . .'
mv './ScrapAssembly/Mars.sh' "${HOME}/.Mars/mars.sh"
echo 'Cleanup . . .'
rm -rf 'ScrapAssembly'

echo 'Setting Path Variables & Making it shell executable . . .'
export 'PATH=$PATH:"$HOME/.Mars/"' >> "${HOME}/.bashrc"


echo 'Restarting Shell, To Test Start IDE Using:'
echo 'mars.sh'
exec $SHELL