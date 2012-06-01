//
//  TagSettingViewController.h
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DepartmentData.h"

@interface TagSettingViewController : UIViewController
-(IBAction)btnCloseTapped:(id)sender;
@property(strong,nonatomic) IBOutlet UIPickerView* pickerview;
@end
