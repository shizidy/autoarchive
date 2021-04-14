#!bin/sh

echo "开始工程清理"
# ${ProjectName}project工程中（非workspace工程）.xcodeproj的文件名字
# ${Target}project工程中编译的target，可省略
# ${WorkspaceName}工程中.xcworkspace的文件名字
# ${Scheme} 当前要编译运行的scheme
# configuration ${Debug或者Release} 当前是要以Debug运行还是以Release运行
# -quiet 忽略警告提示打印
# -UseNewBuildSystem=NO 是否使用新的build系统
# xcodebuild clean -project "${ProjectName}.xcodeproj" -target "${Target}" -scheme "${Scheme}" -configuration ${Debug或者Release} -quiet -UseNewBuildSystem=NO
# xcodebuild clean -workspace "${WorkspaceName}.xcworkspace" -scheme "${Scheme}" -configuration ${Debug或者Release} -quiet -UseNewBuildSystem=NO
xcodebuild clean -project "AAA.xcodeproj" -scheme "AAA" -configuration Release -quiet -UseNewBuildSystem=NO
echo "工程清理完成"

echo "开始工程打包"
# ${ProjectName}project工程中（非workspace工程）.xcodeproj的文件名字
# ${Target}project工程中编译的target，可省略
# ${WorkspaceName}工程中.xcworkspace的文件名字
# ${Scheme} 当前要编译运行的scheme
# configuration ${Debug或者Release} 当前是要以Debug运行还是以Release运行
# -archivePath 导出的.xcarchive文件存放路径
# CODE_SIGN_IDENTITY 证书文件名，可省略（工程配置好，可编译成功即`command+B`运行通过）
# PROVISIONING_PROFILE 运行文件UUID，可省略（工程配置好，可编译成功即`command+B`运行通过）
#xcodebuild archive -workspace "${WorkspaceName}.xcworkspace" -scheme "${Scheme}" -configuration ${Debug或者Release} -archivePath "~/Desktop/..."
xcodebuild archive -project "AAA.xcodeproj" -scheme "AAA" -configuration Release -archivePath "导出的.xcarchive文件存放路径"
echo "工程打包完成"

echo "开始导出IPA包"
# -archivePath archive文件的地址.xcarchive
# -exportPath 导出的ipa文件夹地址
# -exportOptionsPlist ExportOptions.plist文件路径
# CODE_SIGN_IDENTITY=证书
# PROVISIONING_PROFILE=描述文件UUID
xcodebuild -exportArchive -archivePath "导出的.xcarchive文件存放路径" -exportPath "想要导出的ipa存放的文件夹地址" -exportOptionsPlist "ExportOptions.plist"

# -e后面是你的.ipa文件路径
if [[ -e "/Users/你的路径/xxx.ipa" ]]; then
    echo "----------------------------------"
    echo "------------ipa包已导出------------"
    echo "----------------------------------"
    open "/Users/你的路径"
fi
