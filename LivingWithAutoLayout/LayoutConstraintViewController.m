//
//  LayoutConstraintViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/26/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "LayoutConstraintViewController.h"

@interface LayoutConstraintViewController ()

@end

@implementation LayoutConstraintViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeTop;
        self.title = NSLocalizedString(@"NSLayout", @"NSLayoutConstraints");
        self.tabBarItem.image = [UIImage imageNamed:@"85-trophy"];
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
    button2.translatesAutoresizingMaskIntoConstraints=NO;
    button2.layer.borderColor = [[UIColor blackColor] CGColor];
    button2.layer.borderWidth = 1.0;
    [button2 setTitle:@"Ok" forState:UIControlStateNormal];
    [buttonAreaView addSubview:button2];
    
    // setup constraints for the button area
    // @"|[buttonAreaView]|"
    [buttonAreaView.superview addConstraint:[NSLayoutConstraint constraintWithItem:buttonAreaView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:buttonAreaView.superview
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
    [buttonAreaView.superview addConstraint:[NSLayoutConstraint constraintWithItem:buttonAreaView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:buttonAreaView.superview
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]];
    
    // set height
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:buttonAreaView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:100]];
    
    [buttonAreaView.superview addConstraint:[NSLayoutConstraint constraintWithItem:buttonAreaView
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:buttonAreaView.superview
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1
                                                                         constant:0]];
    
    // setup constraints for the buttons

    // button 1 to the left 20pt
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button1
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button1.superview
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1
                                                                constant:20.0]];
    // button 1 & 2 spaced by 8pt
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button1
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button2
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1
                                                                constant:-8.0]];
    
    // button 2 20pt from right
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button2
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button2.superview
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1
                                                                constant:-20.0]];
    
    // button1 & button2 same width -- comment out to add controllable ambiguity
    
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button1
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button2
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:1
                                                                constant:0]];
    
    // button 1 centered in button area
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button1
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button1.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:20]];
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button1
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button1.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:-20]];
    

    // button 2 centered in button area
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button2
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button2.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:20]];
    [buttonAreaView addConstraint:[NSLayoutConstraint constraintWithItem:button2
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:button2.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:-20]];
    

}




@end
