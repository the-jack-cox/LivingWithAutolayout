//
//  Relationship2ViewController.h
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 3/20/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Relationship2ViewController : UIViewController {
    
    __weak IBOutlet UILabel *textLabel;
    
}
- (IBAction)addText:(id)sender;
- (IBAction)subtractText:(id)sender;
- (IBAction)increaseFontSize:(id)sender;
- (IBAction)decreaseFontSize:(id)sender;

@end
