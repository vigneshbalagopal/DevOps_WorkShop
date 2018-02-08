branch=$1
VERSION=`cat .version`
if [ $? -ne 0 ]; then
    if [[ ${branch} =~ release/* ]] || [[ ${branch} =~ develop ]]; then 
	versionNum=$(expr ${branch} | cut -b 9-20)
	echo $versionNum
       PATCHNUM=`expr ${branch}`
       VERSION=$versionNum"-rc."$PATCHNUM
       echo $VERSION > .version
	   
    fi
fi
echo $VERSION
