//
//  ViewController.m
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TagSettingViewController.h"
#import "DepartmentData.h"

@implementation ViewController
@synthesize departNameLabel = _departNameLabel;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //部署設定をラベルにセット
    NSString* deptId = [DepartmentData loadDepartmentId];
    NSArray* deptIdArray = [DepartmentData departmentTagIDArray];
    int index = [deptIdArray indexOfObject:deptId];

    if(index != NSNotFound){    
        NSArray* deptNameArray = [DepartmentData departmentNameArray];
        NSString* deptName = [deptNameArray objectAtIndex:index];
        self.departNameLabel.text = deptName;
    }else{
        self.departNameLabel.text = @"未選択";
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)btnTapTagSetting:(id)sender
{
    //open next window
    TagSettingViewController* tagViewController = [[TagSettingViewController alloc]initWithNibName:@"TagSettingViewController" bundle:nil];
    [self presentModalViewController:tagViewController animated:YES];
}

@end
