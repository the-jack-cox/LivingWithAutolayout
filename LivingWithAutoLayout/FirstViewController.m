//
//  FirstViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/5/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Keyboard", @"Keyboard View");
        self.tabBarItem.image = [UIImage imageNamed:@"161-calculator"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize) contentSizeForViewInPopover {
    return CGSizeMake(320, 100);
}

- (IBAction)button2Pressed:(id)sender {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UIView *senderView = (UIView *)sender;
        FirstViewController *ctl = [[FirstViewController alloc]
                                    initWithNibName:@"FirstViewController_iPhone"
                                    bundle:nil];
        
        _popover = [[UIPopoverController alloc] initWithContentViewController:ctl];
        
        [_popover presentPopoverFromRect:senderView.bounds
                                  inView:senderView
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
        
    }
    
}

- (IBAction)button1Pressed:(id)sender {
    
    FirstViewController *ctl = [[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil];
    
    ctl.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:ctl animated:YES completion:nil];
    
}

- (IBAction)button3Pressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
