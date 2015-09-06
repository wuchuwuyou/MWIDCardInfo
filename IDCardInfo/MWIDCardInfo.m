//
//  MWIDCardInfo.m
//  MWIDCardInfo
//
//  Created by Murphy on 15/9/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWIDCardInfo.h"

@interface MWIDCardInfo ()
@property (nonatomic,strong) NSDictionary *zoneCode;
@end
@implementation MWIDCardInfo

- (MWUser *)userWithIDCard:(NSString *)card{
    if (![MWIDCardValidate validateIdentityCard:card]) {
        NSLog(@"身份证号码错误");
        return nil;
    }
    NSInteger year = [[card substringWithRange:NSMakeRange(6, 4)] integerValue];
    NSInteger month = [[card substringWithRange:NSMakeRange(10, 2)] integerValue];
    NSInteger day = [[card substringWithRange:NSMakeRange(12, 2)] integerValue];
    
    //    NSString *code = [card substringWithRange:NSMakeRange(0, 2)];
    
    NSInteger gender = [[card substringWithRange:NSMakeRange(16, 1)] integerValue];
    NSString *genderStr;
    MWUser *user = [[MWUser alloc] init];
    if (fmod(gender, 2)){
        genderStr = NSLocalizedString(@"男", @"male");
        user.sex = MWUserMale;
    }
    else{
        genderStr = NSLocalizedString(@"女", @"female");
        user.sex = MWUserFemale;
    }
    
    NSString *zone = [card substringWithRange:NSMakeRange(0, 6)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter  alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* localzone = [NSTimeZone systemTimeZone];
    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [dateFormatter setTimeZone:GTMzone];
    NSDate * date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%zd-%zd-%zd",year,month,day]];
    
    date = [NSDate dateWithTimeInterval:3600 sinceDate:date];
    [dateFormatter setTimeZone:localzone];
    user.birthday = date;
    
    NSString * reg = [self.zoneCode objectForKey:zone];
    
    user.region = reg;
    
    return user;
}
+ (MWUser *)userInfoWithidentityCard:(NSString *)identityCard{
    return [[self alloc] userWithIDCard:identityCard];
}


- (NSDictionary *)zoneCode{
    if (!_zoneCode) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ZoneCode" ofType:@"json"];
        NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
        _zoneCode = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    }
    return _zoneCode;
}

@end


@implementation MWUser

- (NSNumber *)age{
    NSDate *date = _birthday;
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone systemTimeZone];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:date toDate:[NSDate date] options:0];
    
    return @(d.year);
}
- (NSString *)description{
    
    return [NSString stringWithFormat:@"sex:%@\n,birthday:%@\n,region:%@\n,age:%@\n",self.sex == MWUserMale?@"男":@"女",self.birthday,self.region,self.age];
}
- (NSString *)debugDescription{
    
    return [NSString stringWithFormat:@"sex:%@\n,birthday:%@\n,region:%@\n,age:%@\n",self.sex == MWUserMale?@"男":@"女",self.birthday,self.region,self.age];
}

@end