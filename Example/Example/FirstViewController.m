//
//  FirstViewController.m
//  Example
//
//  Created by Giordano Scalzo on 14/02/2014.
//
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tagTextfield;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)onSetTagPressed:(id)sender {
    NSString *tag = self.tagTextfield.text;
    [self.tagTextfield resignFirstResponder];
    
    UN_SWIZZ_IT
    SWIZZ_IT_WITH_TAG(tag)
}

- (IBAction)onResetTagPressed:(id)sender {
    UN_SWIZZ_IT
    SWIZZ_IT
    self.tagTextfield.text = @"";
}

@end
