//
//  TestViewController.m
//  Example
//
//  Created by Giordano Scalzo on 17/02/2014.
//
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonPressed:(id)sender {
    UIViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
    
    [self.navigationController pushViewController:nextViewController animated:YES];
}

@end
