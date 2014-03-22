//
//  VFLViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/26/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "VFLViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VFLViewController ()

@end

@implementation VFLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.edgesForExtendedLayout=UIRectEdgeTop;
        
        self.title = NSLocalizedString(@"VFL", @"Visual Format Language");
        self.tabBarItem.image = [UIImage imageNamed:@"26-bandaid"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    buttonAreaView = [[UIView alloc] init];
    buttonAreaView.translatesAutoresizingMaskIntoConstraints = NO;
    buttonAreaView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:buttonAreaView];
    
    button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    button1.layer.borderColor = [[UIColor blackColor] CGColor];
    button1.layer.borderWidth = 1.0;
    [button1 setTitle:@"Cancel" forState:UIControlStateNormal];
    [buttonAreaView addSubview:button1];
    
    button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.layer.borderColor = [[UIColor blackColor] CGColor];
    button2.layer.borderWidth = 1.0;
    button2.translatesAutoresizingMaskIntoConstraints=NO;
    [button2 setTitle:@"Ok" forState:UIControlStateNormal];
    [buttonAreaView addSubview:button2];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(buttonAreaView, button1, button2);
    
    // setup constraints for the button area
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|[buttonAreaView]|"
                                             options:NSLayoutFormatDirectionLeftToRight
                                             metrics:nil
                                               views:views]];
    
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonAreaView(100)]|"
                                             options:NSLayoutFormatDirectionLeftToRight
                                             metrics:nil
                                               views:views]];
    
    
    // Bad one, leads to problems:
//    [buttonAreaView addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"|-(10)-[button1(150)][button2(150)]-(10)-|"
//                                             options:NSLayoutFormatDirectionLeftToRight
//                                             metrics:nil
//                                               views:views]];
    
    // setup constraints for the buttons
    // remove ==button1 to introduce ambiguity
    [buttonAreaView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1]-[button2(==button1)]-|"
                                             options:NSLayoutFormatDirectionLeftToRight
                                             metrics:nil
                                            views:views]];
    
// uncomment next 5 lines to induce a conflict
//    [buttonAreaView addConstraints:
//     [NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1(50)]-[button2(==button1)]-|"
//                                             options:NSLayoutFormatDirectionLeftToRight
//                                             metrics:nil
//                                               views:views]];
    [buttonAreaView addConstraints:
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button1]-|"
                                            options:NSLayoutFormatDirectionLeftToRight
                                            metrics:nil
                                              views:views]];
    [buttonAreaView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button2]-|"
                                             options:NSLayoutFormatDirectionLeftToRight
                                             metrics:nil
                                               views:views]];
}


@end
