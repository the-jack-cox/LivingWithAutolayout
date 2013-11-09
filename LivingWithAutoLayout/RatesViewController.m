//
//  RatesViewController.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 10/8/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "RatesViewController.h"

@interface RatesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rateDescription;
@property (weak, nonatomic) IBOutlet UILabel *asLowAs;
@property (weak, nonatomic) IBOutlet UILabel *pct;
@property (weak, nonatomic) IBOutlet UILabel *apy;
@property (weak, nonatomic) IBOutlet UILabel *disclosure;

@end

@implementation RatesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeTop;
        
        self.title = NSLocalizedString(@"Bi-Dir", @"Bi Directional");
        self.tabBarItem.image = [UIImage imageNamed:@"753-signpost"];
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
    
    self.rateDescription.preferredMaxLayoutWidth = self.view.frame.size.width - 50;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applyFonts {
    self.rateDescription.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.asLowAs.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.pct.font =[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.apy.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.disclosure.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

@end
