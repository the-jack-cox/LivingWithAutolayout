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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int buttonNumber = 0;
    NSMutableDictionary *buttonNames = [[NSMutableDictionary alloc] initWithCapacity:9];
    for(UIButton *button in buttons) {
        NSString *buttonLabel = [NSString stringWithFormat:@"b%d", buttonNumber];
        [buttonNames setObject:button forKey:buttonLabel];
        [button setTitle:[NSString stringWithFormat:@"%d", buttonNumber]
                forState:UIControlStateNormal];
        [button removeConstraints:button.constraints];
        buttonNumber++;
    }
    
    [self.view removeConstraints:self.view.constraints];
    
    NSArray *constraintStrings = @[
    @"|-[b7]-[b8(==b7)]-[b9(==b7)]-|",
    @"|-[b4(==b7)]-[b5(==b7)]-[b6(==b7)]",
    @"|-[b1(==b7)]-[b2(==b7)]-[b3(==b7)]",
    @"|-[b0]-|",
    @"V:|-[b7]-[b4(==b7)]-[b1(==b7)]-[b0(==b7)]-|",
    @"V:|-[b8(==b7)]-[b5(==b7)]-[b2(==b7)]",
    @"V:|-[b9(==b7)]-[b6(==b7)]-[b3(==b7)]",
    ];
    
    for(NSString *constraintString in constraintStrings) {
        
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:constraintString
                                                 options:NSLayoutFormatDirectionLeftToRight
                                                 metrics:nil
                                                   views:buttonNames]];
        
    }
}



@end
