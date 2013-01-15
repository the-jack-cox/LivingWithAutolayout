//
//  SecondViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/5/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


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
        [button setTitle:[NSString stringWithFormat:@"%d", buttonNumber] forState:UIControlStateNormal];
        [button removeConstraints:button.constraints];
        buttonNumber++;
    }
    
    [self.view removeConstraints:self.view.constraints];
    
    NSArray *constraintStrings = @[
        @"|-[b7]-[b8(==b7)]-[b9(==b8)]-|",
        @"|-[b4(==b7)]-[b5(==b4)]-[b6(==b5)]",
        @"|-[b1(==b4)]-[b2(==b1)]-[b3(==b2)]",
        @"|-[b0]-|",
        @"V:|-[b7]-[b4(==b7)]-[b1(==b4)]-[b0(==b1)]-|",
        @"V:|-[b8(==b7)]-[b5(==b8)]-[b2(==b5)]",
        @"V:|-[b9(==b8)]-[b6(==b9)]-[b3(==b6)]",
    ];
    
    for(NSString *constraintString in constraintStrings) {
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintString
                                                                          options:NSLayoutFormatDirectionLeftToRight
                                                                          metrics:nil 
                                                                             views:buttonNames]];
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
