//
//  ViewController.m
//  MWIDCardInfo
//
//  Created by Murphy on 15/9/5.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "ViewController.h"
#import "MWIDCardInfo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   MWUser *user = [MWIDCardInfo userInfoWithidentityCard:@"120113198803020816"];
    NSLog(@"%@",user);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
