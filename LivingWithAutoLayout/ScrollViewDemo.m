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
        self.edgesForExtendedLayout=UIRectEdgeAll;
        self.title = NSLocalizedString(@"Scroll", @"Scroll View Demo");
        self.tabBarItem.image = [UIImage imageNamed:@"26-bandaid"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]
                                                 initWithImage:[UIImage imageNamed:@"838-dice"]
                                                 style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:@selector(changeText:)],
                                                [[UIBarButtonItem alloc]
                                                 initWithImage:[UIImage imageNamed:@"764-arrow-down"]
                                                 style:UIBarButtonItemStylePlain
                                                 
                                                 target:self
                                                 action:@selector(smallerFont:)],
                                                [[UIBarButtonItem alloc]
                                                 initWithImage:[UIImage imageNamed:@"763-arrow-up"]
                                                 
                                                 style:UIBarButtonItemStylePlain
                                                 
                                                 target:self
                                                 action:@selector(biggerFont:)]
                                                
                                                
                                                ];
    
    for(UILabel *label in self.labels) {
        label.text = [self randomText];
        label.preferredMaxLayoutWidth = self.view.frame.size.width;
    }
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.firstLabel
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:10]];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    for(UILabel *label in self.labels) {
        label.preferredMaxLayoutWidth = self.view.frame.size.width;
    }
}

- (void) changeText:(id)sender {
    for(UILabel *label in self.labels) {
        label.text = [self randomText];
        
    }
    [self.view setNeedsLayout];
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
}

- (void) adjustFontSize:(int)sizeChange {
    
    [self.view setNeedsLayout];
    [UIView animateWithDuration:2.0 animations:^{
        for(UILabel *label in self.labels) {
            label.font = [label.font fontWithSize:label.font.pointSize+sizeChange];
            
        }
        [self.view layoutIfNeeded];
    }];
}
- (void) biggerFont:(id)sender {
    [self adjustFontSize:1];
    
}
- (void) smallerFont:(id)sender {
    [self adjustFontSize:-1];
}

- (NSString *)randomText {
    
    NSString *base = @"Bacon ipsum dolor sit amet pancetta corned beef chicken cow, sausage filet mignon strip steak turkey beef beef ribs chuck andouille ball tip kielbasa. Kielbasa chicken turducken venison frankfurter, fatback kevin tenderloin ground round sausage. Spare ribs turducken pig meatloaf pastrami. Salami pork ribeye, sirloin frankfurter spare ribs chuck filet mignon shoulder drumstick bresaola tenderloin tongue.";
    
    NSArray *words = [base componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]];
    
    NSUInteger wordCount = rand() % 25;
    
    NSString *ret = @"";
    
    for(int i = 0;i<wordCount;i++) {
        
        NSUInteger *wordIdx = rand() % words.count;
        
        ret = [[ret stringByAppendingString:[words objectAtIndex:wordIdx]] stringByAppendingString:@" "];
    }
    return ret;
}
@end
