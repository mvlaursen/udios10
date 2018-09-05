//
//  ViewController.m
//  S17ObjArrays
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *a = @[@"Apple", @"Banana", @"Chickenfruit"];
    self.label.text = a[2];
    
    NSMutableArray *ma = [[NSMutableArray alloc] initWithObjects:@"Alpha", @"Bravo", @"Charlie", nil];
    [ma addObject:@"Delta"];
    self.label2.text = ma[2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
