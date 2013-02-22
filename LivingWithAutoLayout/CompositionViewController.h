//
//  CompositionViewController.h
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/15/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BrevityViewController;
@interface CompositionViewController : UIViewController {
    
    __weak IBOutlet UIView *numericDisplayArea;
    IBOutlet UIView *numericDisplayContent;
    __weak IBOutlet UIView *keypadArea;
    __weak IBOutlet UILabel *value;
    __weak IBOutlet UILabel *valueSqrt;
    
    BrevityViewController   *keypadCtl;
}
- (IBAction)toggleFormat:(id)sender;

@end
