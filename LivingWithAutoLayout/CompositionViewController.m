//
//  CompositionViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/15/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "CompositionViewController.h"

#import "BrevityViewController.h"

#import "UIView+ConstraintHelpers.h"

@interface CompositionViewController ()

@end

@implementation CompositionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Composition", @"Third VC");
        self.tabBarItem.image = [UIImage imageNamed:@"36-toolbox"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BrevityViewController *keypadCtl = [[BrevityViewController alloc] initWithNibName:@"BrevityViewController" bundle:nil];
    
    
    [keypadArea addSubview:keypadCtl.view];
    [self addChildViewController:keypadCtl];
    keypadCtl.view.translatesAutoresizingMaskIntoConstraints = NO;
    [keypadCtl.view fillSuperview];
    
    numericDisplayContent.translatesAutoresizingMaskIntoConstraints=NO;
    [numericDisplayArea addSubview:numericDisplayContent];
    [numericDisplayContent fillSuperview];
}


@end
