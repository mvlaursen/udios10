//
//  ViewController.m
//  S18ObjFunctions
//
//  Created by Mike Laursen on 9/5/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setText:(UIButton *)sender {
    self.label.text = @"Hello";
    self.textView.text = [[self.textView.text stringByAppendingString:self.textField.text] stringByAppendingString:@"\n"];
}
- (IBAction)setText2:(UITextField *)sender {
    [self resignFirstResponder];
    self.label.text = @"Hello";
    self.textView.text = [[self.textView.text stringByAppendingString:self.textField.text] stringByAppendingString:@"\n"];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound) {
        return YES;
    }
    
    [textView resignFirstResponder];
    return NO;
}

@end
