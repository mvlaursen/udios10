//
//  ViewController.h
//  S17ObjVariables
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// TODO: Experiment with moving these to .m so they are "private".

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;

@end

