//
//  UIViewController+Swizzling.h
//  Testing
//
//  Created by Rui Peres on 12/08/2013.
//  Copyright (c) 2013 Rui Peres. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Swizzling)

/**
 It will swizz the methods:
 viewDidLoad
 @return void
 */
+ (void)swizzIt;

/**
 It will undo what was done with the swizzIt
 @return void
 */
+ (void)undoSwizz;

@end
