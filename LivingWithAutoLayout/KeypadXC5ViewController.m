//
//  KeypadXC5ViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 8/18/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "KeypadXC5ViewController.h"

@interface KeypadXC5ViewController ()

@end

@implementation KeypadXC5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeTop;
        self.title = NSLocalizedString(@"XC5", @"Keyboard View");
        self.tabBarItem.image = [UIImage imageNamed:@"22-skull-n-bones"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
