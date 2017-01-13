# MWIDCardInfo(身份证信息)
[![version](https://img.shields.io/cocoapods/v/MWIDCardValidate.svg)](https://img.shields.io/cocoapods/v/MWIDCardValidate.svg)
[![License](https://img.shields.io/cocoapods/l/MWIDCardValidate.svg)](https://github.com/wuchuwuyou/MWVerifyID/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/MWIDCardValidate.svg)](https://img.shields.io/cocoapods/p/MWIDCardValidate.svg)
##Installation
###CocoaPods
	#Your Podfile
	platform :ios, '7.0'
	pod 'MWIDCardInfo', '~> 1.0.2'
	

###MWUser
	typedef NS_ENUM(NSUInteger, MWUserType) {
    	MWUserMale = 1,
    	MWUserFemale
	};
	MWUserType sex;
	NSNumber   *age;
	NSDate     *birthday;
	NSString   *region;
###Usage
`身份证信息`

	MWUser *user = [MWIDCardInfo userInfoWithidentityCard:@"IDNumber"];
	
###Licenses
MIT License