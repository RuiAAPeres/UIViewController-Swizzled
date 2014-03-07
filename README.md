UIViewController+Swizzled
=============
-------------

Category used to map your way inside an application. This is specially useful when you are working with a complex path and you are new to the project. Using this category will see the name of the UIViewController you are in, plus a representation of how deep you are.

This is a companion of the my other category [NSURLConnection+Swizzled.h](https://github.com/RuiAAPeres/RPNSURLConnection-Swizzled)

**Don't forget to disable it in production code. This is only for debugging**

------------
Requirements
============

Include the library:

* libobjc.dylib

And import the category where you want to use it:

* `#import "UIViewController+Swizzled.h"`

------------------------------------
Adding UIViewController+Swizzled to your project
====================================

*	Just add the two files inside your project (`UIViewController+Swizzled.h` and `UIViewController+Swizzled.m`).

**Or**

*	Cocoapods: pod 'UIViewController+Swizzled', '~> 1.2'

-----
Usage
=====

In order to get the full output you should `SWIZZ_IT` right in the AppDelegate `- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions`. If for some reason you want to stop, just `UN_SWIZZ_IT`.
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SWIZZ_IT;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    // Your code...
    
    return YES;
}
```

This will output:

```
2013-09-09 18:58:42.360 Testing[25399:c07] -> UINavigationController
2013-09-09 18:58:42.361 Testing[25399:c07] ---> RPViewController
2013-09-09 18:59:55.072 Testing[25399:c07] -----> RPSecondViewController
2013-09-09 18:59:57.367 Testing[25399:c07] -------> RPThirdViewController
2013-09-09 18:59:58.801 Testing[25399:c07] -----> RPSecondViewController
2013-09-09 19:00:00.282 Testing[25399:c07] -------> RPThirdViewController
2013-09-09 19:00:01.906 Testing[25399:c07] ---------> RPViewController
2013-09-09 19:00:03.515 Testing[25399:c07] -------> RPThirdViewController
2013-09-09 19:00:04.267 Testing[25399:c07] -----> RPSecondViewController
2013-09-09 19:00:05.041 Testing[25399:c07] ---> RPViewController
2013-09-09 19:00:07.193 Testing[25399:c07] -----> RPSecondViewController
2013-09-09 19:00:08.312 Testing[25399:c07] -------> RPThirdViewController
2013-09-09 19:00:09.396 Testing[25399:c07] ---------> RPViewController
2013-09-09 19:00:10.183 Testing[25399:c07] -----------> RPSecondViewController
2013-09-09 19:00:10.905 Testing[25399:c07] -------------> RPThirdViewController
2013-09-09 19:00:12.141 Testing[25399:c07] ---------------> RPViewController
2013-09-09 19:00:13.156 Testing[25399:c07] -----------------> RPSecondViewController
```

-------
License
=======

This code is distributed under the terms and conditions of the MIT license. 


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/RuiAAPeres/uiviewcontroller-swizzled/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

