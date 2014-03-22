//
//  KeypadXC5ViewController.h
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 8/18/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeypadXC5ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button1and5height;

@end
