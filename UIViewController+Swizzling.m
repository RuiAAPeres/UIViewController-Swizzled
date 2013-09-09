//
//  UIViewController+Swizzling.m
//  Testing
//
//  Created by Rui Peres on 12/08/2013.
//  Copyright (c) 2013 Rui Peres. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)


// Poor's man flag. Used to know if the methods are already Swizzed
static BOOL isSwizzed;

+(void)load
{
    isSwizzed = NO;
}

#pragma mark - Util methods

static void swizzClass(Class class, SEL originalSel, SEL newSel)
{
    Method origMethod = class_getClassMethod(class, originalSel);
    Method newMethod = class_getClassMethod(class, newSel);
    
    method_exchangeImplementations(origMethod, newMethod);
}

static void swizzInstance(Class class, SEL originalSel, SEL newSel)
{
    Method origMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    
    method_exchangeImplementations(origMethod, newMethod);
}

#pragma mark - SwizzMethods

- (void)printPath
{
    if ([self parentViewController] == nil)
    {
        NSLog(@"-> %@",[self.class description]);
    }
    
    if([[self parentViewController] isMemberOfClass:[UINavigationController class]])
    {
        UINavigationController *nav = (UINavigationController *)[self parentViewController];
        NSInteger integer = [[nav viewControllers] indexOfObject:self];
        
        NSString *level = @"";
        for (int i = 0; i<=integer; i++)
        {
            level = [level stringByAppendingFormat:@"--"];
        }
        
        NSLog(@"%@-> %@", level,[self.class description]);
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
    
    isSwizzed = YES;
    // First we take care about the initWithRequest:delegate:startImmediately: (notice that it's a instance method)
    swizzInstance([self class],@selector(viewDidAppear:),@selector(swizzviewDidAppear:));
}

+ (void)undoSwizz
{
    // We won't do anything if it has not been Swizzed
    if (!isSwizzed)
    {
        return;
    }
    
    isSwizzed = NO;
    // First we take care about the initWithRequest:delegate:startImmediately: (notice that it's a instance method)
    swizzInstance([self class],@selector(swizzViewDidLoad),@selector(viewDidLoad));
}

@end
