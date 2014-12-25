//
//  UIViewController+Swizzled.m
//
//  Created by Rui Peres on 12/08/2013.
//  Copyright (c) 2013 Rui Peres. All rights reserved.
//

#import "UIViewController+Swizzled.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzled)

// Poor's man flag. Used to know if the methods are already Swizzed
static BOOL isSwizzed;

static NSString *logTag = @"";

+(void)load
{
    isSwizzed = NO;
}

#pragma mark - Util methods

static void swizzInstance(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)logWithLevel:(NSUInteger)level
{
    NSString *paddingItems = @"";
    for (NSUInteger i = 0; i<=level; i++)
    {
        paddingItems = [paddingItems stringByAppendingFormat:@"--"];
    }
    
    NSLog(@"%@%@-> %@", logTag, paddingItems, [self.class description]);
}


#pragma mark - SwizzMethods

- (void)printPath
{
    if ([self parentViewController] == nil)
    {
        [self logWithLevel:0];
    }
    else if([[self parentViewController] isMemberOfClass:[UINavigationController class]])
    {
        UINavigationController *nav = (UINavigationController *)[self parentViewController];
        NSInteger integer = [[nav viewControllers] indexOfObject:self];
        [self logWithLevel:integer];
    }
    else if ([[self parentViewController] isMemberOfClass:[UITabBarController class]])
    {
        [self logWithLevel:1];
    }
}

-(void)swizzviewDidAppear:(BOOL)animated
{
    [self printPath];
    
    // Call the original method (viewWillAppear)
    [self swizzviewDidAppear:animated];
}

#pragma mark - Public methods

+ (void)swizzIt
{
    // We won't do anything if it's already swizzed
    if (isSwizzed)
    {
        return;
    }
    
    swizzInstance([self class],@selector(viewDidAppear:),@selector(swizzviewDidAppear:));
    
    isSwizzed = YES;
}

+ (void)swizzItWithTag:(NSString *)tag
{
    logTag = tag;
    [self swizzIt];
}

+ (void)undoSwizz
{
    // We won't do anything if it has not been Swizzed
    if (!isSwizzed)
    {
        return;
    }
    
    isSwizzed = NO;
    swizzInstance([self class],@selector(swizzviewDidAppear:),@selector(viewDidAppear:));
}

@end
