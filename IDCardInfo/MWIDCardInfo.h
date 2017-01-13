//
//  MWIDCardInfo.h
//  MWIDCardInfo
//
//  Created by Murphy on 15/9/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MWIDCardValidate.h>
@class MWUser;
@interface MWIDCardInfo : NSObject
+ (MWUser *)userInfoWithidentityCard:(NSString *)identityCard;
@end


typedef NS_ENUM(NSUInteger, MWUserType) {
    MWUserMale = 1,
    MWUserFemale
};


@interface MWUser : NSObject

@property (nonatomic,assign) MWUserType sex;
@property (nonatomic,strong) NSNumber   *age;
@property (nonatomic,strong) NSDate     *birthday;
@property (nonatomic,copy) NSString   *region;

@end
