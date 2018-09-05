//
//  ViewController.m
//  S17ObjConditionals
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    bool state = false;
    
    if (state)
        self.label1.text = @"state is true.";
    else
        self.label1.text = @"state is false.";
    
    int index = 0;
    while (index < 5) {
        NSLog(@"%i", index);
        index++;
    }
    
    for (int i = 0; i < 5; i++)
        NSLog(@"%i", i);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
