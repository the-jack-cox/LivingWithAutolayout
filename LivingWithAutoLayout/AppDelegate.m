//
//  AppDelegate.m
//  LivingWithAutoLayout
//
//  Created by Jack Cox on 1/5/13.
//  Copyright (c) 2013 CapTech Ventures, Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "IBViewController.h"

#import "BrevityViewController.h"

#import "CompositionViewController.h"
#import "RelationShipViewController.h"
#import "VFLViewController.h"
#import "LayoutConstraintViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[
    [[VFLViewController alloc] initWithNibName:@"VFLViewController" bundle:nil],
    [[LayoutConstraintViewController alloc] initWithNibName:@"LayoutConstraintViewController" bundle:nil],
    [[BrevityViewController alloc] initWithNibName:@"BrevityViewController" bundle:nil ],
    [[IBViewController alloc] initWithNibName:@"IBViewController" bundle:nil],
    [[RelationShipViewController alloc] initWithNibName:@"RelationShipViewController" bundle:nil],
    [[CompositionViewController alloc] initWithNibName:@"CompositionViewController" bundle:nil]
    ];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) findAmbiguity:(UIView *) v {
    
    for (UIView *aView in [v subviews]) {
        if ([aView hasAmbiguousLayout]) {
            NSLog(@"View Frame %@", NSStringFromCGRect(aView.frame));
            NSLog(@"%@", [aView class]);
            NSLog(@"%@", [aView constraintsAffectingLayoutForAxis:1]);
            NSLog(@"%@", [aView constraintsAffectingLayoutForAxis:0]);
            
            [aView exerciseAmbiguityInLayout];
            
        }
        [self findAmbiguity:aView];
    }
}
- (void)dumpAmbiguity {
    [self findAmbiguity:self.window];
    
}

@end
