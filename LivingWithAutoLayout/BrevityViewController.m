//
//  SecondViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/5/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "BrevityViewController.h"

@interface BrevityViewController ()

@end

@implementation BrevityViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Brevity", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"60-signpost"];
    }
    return self;
}
- (NSArray *)phoneConstraints {
    return @[
    @"|[b1][b2(==b1)][b3(==b1)]|",
    @"|[b4(==b1)][b5(==b1)][b6(==b1)]",
    @"|[b7(==b1)][b8(==b1)][b9(==b1)]",
    @"|[b0]|",
    @"V:|[b1][b4(==b1)][b7(==b1)][b0(==b1)]|",
    @"V:|[b2(==b1)][b5(==b1)][b8(==b1)]",
    @"V:|[b3(==b1)][b6(==b1)][b9(==b1)]",
    ];
}
- (NSArray *)keypadConstraints {
    // add -| on the end of the 2nd & 3rd lines to introduct conflict
    return @[
    @"|-[b7]-[b8(==b7)]-[b9(==b7)]-|",
    @"|-[b4(==b7)]-[b5(==b7)]-[b6(==b7)]-|",
    @"|-[b1(==b7)]-[b2(==b7)]-[b3(==b7)]-|",
    @"|-[b0]-|",
    @"V:|-[b7]-[b4(==b7)]-[b1(==b7)]-[b0(==b7)]-|",
    @"V:|-[b8(==b7)]-[b5(==b7)]-[b2(==b7)]",
    @"V:|-[b9(==b7)]-[b6(==b7)]-[b3(==b7)]",
    ];
}
- (void)clearButtonConstraints
{
    for(UIButton *button in buttons) {
        [button removeConstraints:button.constraints];
    }
}

- (void)applyButtonConstraints:(NSArray *)constraintStrings
{
    for(NSString *constraintString in constraintStrings) {
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:constraintString
                                                 options:NSLayoutFormatDirectionLeftToRight
                                                 metrics:nil
                                                   views:buttonNames]];

    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int buttonNumber = 0;
    buttonNames = [[NSMutableDictionary alloc] initWithCapacity:10];
    for(UIButton *button in buttons) {
        NSString *buttonLabel = [NSString stringWithFormat:@"b%d", buttonNumber];
        [buttonNames setObject:button forKey:buttonLabel];
        [button setTitle:[NSString stringWithFormat:@"%d", buttonNumber]
                forState:UIControlStateNormal];
        buttonNumber++;
    }
    
    [self.view removeConstraints:self.view.constraints];
    
    [self makeCalculatorFormat];
}

- (void) makeCalculatorFormat {
    [self.view removeConstraints:self.view.constraints];
    [self clearButtonConstraints];
    NSArray *constraintStrings = [self keypadConstraints];
    
    [self applyButtonConstraints:constraintStrings];
    calcFormat=YES;
}

- (void)makePhoneFormat {
    [self.view removeConstraints:self.view.constraints];
    [self clearButtonConstraints];
    NSArray *constraintStrings = [self phoneConstraints];
    [self applyButtonConstraints:constraintStrings];
    calcFormat = NO;
}

- (void) toggleFormat {
    if (calcFormat) {
        [self makePhoneFormat];
    } else {
        [self makeCalculatorFormat];
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
