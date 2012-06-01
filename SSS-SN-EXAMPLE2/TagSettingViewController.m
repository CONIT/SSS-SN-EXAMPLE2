//
//  TagSettingViewController.m
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TagSettingViewController.h"
#import "DepartmentData.h"



@implementation TagSettingViewController

@synthesize pickerview=_pickerview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark == Event Handler ==
-(IBAction)btnCloseTapped:(id)sender
{

    //選択した部署を保存する
    NSInteger row = [self.pickerview selectedRowInComponent:0];
    NSArray* deptIdArray= [DepartmentData departmentTagIDArray];

    [DepartmentData saveDepartmentId:[deptIdArray objectAtIndex:row]];
    
    //部署情報を変更したのでDeviceToken再取得しSNサーバに再登録
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound];

    
    //閉じる
    if ([self respondsToSelector:@selector(presentingViewController)]){
        //ios 5
        [self.presentingViewController dismissModalViewControllerAnimated:YES];
    }else{
        //ios 4
        [self.parentViewController dismissModalViewControllerAnimated:YES];
    }

    
}

#pragma mark == PickerView data==
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray* deptIdArray= [DepartmentData departmentTagIDArray];
    return [deptIdArray count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray* deptNameArray= [DepartmentData departmentNameArray];
    NSArray* deptIdArray= [DepartmentData departmentTagIDArray];
    NSString* labelText = [NSString stringWithFormat:@"%@(id:%@)",[deptNameArray objectAtIndex:row],[deptIdArray objectAtIndex:row]];
    return labelText;
}

@end
