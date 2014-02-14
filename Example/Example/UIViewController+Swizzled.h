//
//  UIViewController+Swizzled.h
//
//  Created by Rui Peres on 12/08/2013.
//  Copyright (c) 2013 Rui Peres. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SWIZZ_IT [UIViewController swizzIt];
#define SWIZZ_IT_WITH_TAG(tag) [UIViewController swizzItWithTag:tag];

#define UN_SWIZZ_IT [UIViewController undoSwizz];

/**
 Used to map your way inside your application, by logging the name
 of your UIViewController + a representation of how deep you are
 */
@interface UIViewController (Swizzled)

/**
 It will swizz the methods:
 viewDidLoad
 @return void
 */
+ (void)swizzIt;

/**
 It will swizz the methods:
 viewDidLoad
 and prepend "tag" to each line of log
 @return void
 */
+ (void)swizzItWithTag:(NSString *)tag;

/**
 It will undo what was done with the swizzIt
 @return void
 */
+ (void)undoSwizz;

@end
