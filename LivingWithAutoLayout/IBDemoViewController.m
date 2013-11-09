//
//  IBDemoViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 11/9/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "IBDemoViewController.h"

@interface IBDemoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end

@implementation IBDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.edgesForExtendedLayout=UIRectEdgeTop;
        
        self.title = NSLocalizedString(@"IB", @"IB Demo");
        self.tabBarItem.image = [UIImage imageNamed:@"1013-hammer"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cancelButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.cancelButton.layer.borderWidth = 1.0;
    
    self.okButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.okButton.layer.borderWidth = 1.0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
