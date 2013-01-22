//
//  RelationShipViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/21/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "RelationShipViewController.h"

@interface RelationShipViewController ()

@end

@implementation RelationShipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Relationships", @"Third VC");
        self.tabBarItem.image = [UIImage imageNamed:@"76-baby"];
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

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newValue = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    [self.resizingButton setTitle:newValue forState:UIControlStateNormal];
    
    return YES;
}

@end
