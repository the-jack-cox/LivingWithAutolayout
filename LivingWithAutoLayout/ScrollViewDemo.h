//
//  ScrollViewDemo.h
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 3/22/14.
//  Copyright (c) 2014 CapTech Ventures, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewDemo : UIViewController
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastLabel;

@end
