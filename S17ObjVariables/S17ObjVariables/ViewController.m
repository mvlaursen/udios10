//
//  ViewController.m
//  S17ObjVariables
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *string1 = @"Hello";
    NSString *string2 = @"world";
    self.label1.text = [NSString stringWithFormat:@"%@, %@", string1, string2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
