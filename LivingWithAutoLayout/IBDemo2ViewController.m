//
//  IBDemo2ViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 11/9/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "IBDemo2ViewController.h"



@interface IBDemo2ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeTextButton;

@end

@implementation IBDemo2ViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.edgesForExtendedLayout=UIRectEdgeAll;
        self.title = NSLocalizedString(@"IB2", @"IB2");
        self.tabBarItem.image = [UIImage imageNamed:@"944-walking-man"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applyFonts)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.bottomLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 10;
    self.topLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 10;
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)changeText:(id)sender {

    self.topLabel.text = [self randomText];
    self.bottomLabel.text = [self randomText];

}

- (void)applyFonts {
    self.topLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.bottomLabel.font =[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.changeTextButton.titleLabel.font =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (NSString *)randomText {
    
    NSString *base = @"Bacon ipsum dolor sit amet pancetta corned beef chicken cow, sausage filet mignon strip steak turkey beef beef ribs chuck andouille ball tip kielbasa. Kielbasa chicken turducken venison frankfurter, fatback kevin tenderloin ground round sausage. Spare ribs turducken pig meatloaf pastrami. Salami pork ribeye, sirloin frankfurter spare ribs chuck filet mignon shoulder drumstick bresaola tenderloin tongue.";
    
    NSArray *words = [base componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]];
    
    NSUInteger wordCount = rand() % 15;
    
    NSString *ret = @"";
    
    for(int i = 0;i<wordCount;i++) {
        
        NSUInteger *wordIdx = rand() % words.count;
        
        ret = [[ret stringByAppendingString:[words objectAtIndex:wordIdx]] stringByAppendingString:@" "];
    }
    return ret;
}
@end

