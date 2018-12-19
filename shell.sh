#! /bin/bash


function subString () {
varible=$1
string=$2

value=${varible##*$string}

echo $value
}


function subString2 () {
varible=$1
string=$2

value=${varible#*$string}

echo $value
}


# $1: from file
# $2: to folder
function copyToDest() {
fromFile=$1
toFoder=$2

fileName=`subString $fromFile "/"`

fileType=`subString $fileName "."`
fileType=`subString2 $fileName "."`

sudo cp -rf $fromFile $toFoder/$fileName
sudo chmod 644 $toFoder/$fileName
sudo chown root:wheel $toFoder/$fileName
}

# $1: from file
# $2: to folder
# $3: filename
function makeLn() {

fromFile=$1
toFile=$2

sudo ln -s $fromFile $toFile
sudo chmod 644 $toFile
sudo chown root:wheel $toFile
}



# $1: folder
# $2: from file
# $3: to file
function makeLnEx() {
	folderName=$1
	fromFile=$2
	toFile=$3

	cd $folderName
	sudo ln -s $fromFile $toFile
	sudo chmod 644 $toFile
	sudo chown root:wheel $toFile
}

currentFolder=`pwd`
#############################Device######################################
#For Device


cd $currentFolder
#Put tbd copy to the path:
deviceLibFile="./iPhone-Device/libstdc++.6.0.9.tbd"  
deviceDestTbdLibFolder="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib"

copyToDest $deviceLibFile $deviceDestTbdLibFolder
# makeLn $deviceDestTbdLibFolder/libstdc++.6.0.9.tbd $deviceDestTbdLibFolder/libstdc++.6.tbd
# makeLn $deviceDestTbdLibFolder/libstdc++.6.0.9.tbd $deviceDestTbdLibFolder/libstdc++.tbd
makeLnEx $deviceDestTbdLibFolder libstdc++.6.0.9.tbd libstdc++.6.tbd
makeLnEx $deviceDestTbdLibFolder libstdc++.6.0.9.tbd libstdc++.tbd


#############################Simulator######################################
#For Simulator

cd $currentFolder
#Put dylib copy to the path:
simDylibLibFile="./iPhone-Simulator/libstdc++.6.0.9.dylib"
simDestDylibLibFolder="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib"

copyToDest $simDylibLibFile $simDestDylibLibFolder
# makeLn $simDestDylibLibFolder/libstdc++.6.0.9.dylib $simDestDylibLibFolder/libstdc++.6.dylib
# makeLn $simDestDylibLibFolder/libstdc++.6.0.9.dylib $simDestDylibLibFolder/libstdc++.dylib
makeLnEx $simDestDylibLibFolder libstdc++.6.0.9.dylib libstdc++.6.dylib
makeLnEx $simDestDylibLibFolder libstdc++.6.0.9.dylib libstdc++.dylib


cd $currentFolder
#Put tdb copy to the path:
simTbdLibFile="./iPhone-Simulator/libstdc++.6.0.9.tbd"
simDestTdbLibFolder="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib"

copyToDest $simTbdLibFile $simDestTdbLibFolder
# makeLn $simDestTdbLibFolder/libstdc++.6.0.9.tbd $simDestTdbLibFolder/libstdc++.6.tbd
# makeLn $simDestTdbLibFolder/libstdc++.6.0.9.tbd $simDestTdbLibFolder/libstdc++.tbd
makeLnEx $simDestTdbLibFolder libstdc++.6.0.9.tbd libstdc++.6.tbd
makeLnEx $simDestTdbLibFolder libstdc++.6.0.9.tbd libstdc++.tbd






