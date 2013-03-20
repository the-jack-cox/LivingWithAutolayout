//
//  Relationship2ViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 3/20/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "Relationship2ViewController.h"

@interface Relationship2ViewController ()

@end

@implementation Relationship2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Relationships 2", @"");
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

- (void)animateChange {
    [UIView animateWithDuration:0.25
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (IBAction)addText:(id)sender {
    textLabel.text = [textLabel.text stringByAppendingString:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. "];
    [self animateChange];
}

- (IBAction)subtractText:(id)sender {
    NSString *text = textLabel.text;
    if (text.length >= 10) {
        text = [text substringToIndex:text.length-10];
    }
    textLabel.text = text;
    [self animateChange];
}

- (IBAction)increaseFontSize:(id)sender {
    textLabel.font = [textLabel.font fontWithSize:textLabel.font.pointSize+1];
    [self animateChange];
}

- (IBAction)decreaseFontSize:(id)sender {
    textLabel.font = [textLabel.font fontWithSize:textLabel.font.pointSize-1];
    [self animateChange];
}
@end
