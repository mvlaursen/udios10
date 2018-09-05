//
//  ViewController.m
//  S17ObjVariables
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *s1 = @"Hello";
    NSString *s2 = @"world";
    self.label1.text = [NSString stringWithFormat:@"%2$@, %1$@", s2, s1];
    
    int i = 42;
    int j = 13;
    self.label2.text = [NSString stringWithFormat:@"%d", i + j];
    
    double f1 = 123.456;
    double f2 = 667.321;
    self.label3.text = [NSString stringWithFormat:@"%.2f %.2f", f1, f2];
    
    bool b1 = false;
    bool b2 = NO;
    self.button.enabled = b1;
    self.switchOutlet.on = b2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
