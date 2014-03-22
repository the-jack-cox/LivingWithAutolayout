//
//  ScrollViewDemo.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 3/22/14.
//  Copyright (c) 2014 CapTech Ventures, Inc. All rights reserved.
//

#import "ScrollViewDemo.h"

@interface ScrollViewDemo ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ScrollViewDemo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
