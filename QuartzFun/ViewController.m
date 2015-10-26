//
//  ViewController.m
//  QuartzFun
//
//  Created by bottle on 15/10/26.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "ViewController.h"
#import "HBConstants.h"
#import "QuartzFunView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)colorChange:(id)sender {
    UISegmentedControl *control = sender;
    ColorTabIndex index = [control selectedSegmentIndex];
    QuartzFunView *funView = (QuartzFunView*)self.view;
    
    switch (index) {
        case kRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            funView.currentColor = [UIColor blueColor];
            funView.useRandomColor = NO;
            break;
        case kYellowColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            funView.useRandomColor = YES;
        default:
            break;
    }
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl *control = sender;
    [(QuartzFunView*)self.view setShareType:control.selectedSegmentIndex];
    
    if (control.selectedSegmentIndex == kImageShape) {
        self.colorControl.enabled = NO;
    }
    else{
        self.colorControl.enabled = YES;
    }
}

@end
