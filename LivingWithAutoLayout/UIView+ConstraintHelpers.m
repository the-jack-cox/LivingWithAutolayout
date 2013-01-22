//
//  UIView+ConstraintHelpers.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/15/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "UIView+ConstraintHelpers.h"

@implementation UIView (ConstraintHelpers)


- (void) fillSuperviewHorizontally {
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1
                                                      constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0.0]];
    
}
- (void) fillSuperviewVertically {
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:0.0]];
}

- (void) fillSuperview {
    [self fillSuperviewHorizontally];
    [self fillSuperviewVertically];
}

@end
