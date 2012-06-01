//
//  DepartmentData.m
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DepartmentData.h"

NSArray* departmentNameArray = nil;
NSArray* departmentTagIDArray = nil;

@implementation DepartmentData

+(NSArray*) departmentNameArray
{
    if(departmentNameArray == nil){
        departmentNameArray = [NSArray arrayWithObjects:@"営業１部",@"営業２部",@"開発１部",@"開発２部", nil];
    }
    return departmentNameArray;
}
+(NSArray*) departmentTagIDArray
{
    if(departmentTagIDArray == nil){
        departmentTagIDArray= [NSArray arrayWithObjects:@"sales_1",@"sales_2",@"dev_1",@"dev_2", nil];
    }
    return departmentTagIDArray;
}
+(void)saveDepartmentId:(NSString*) deptId
{
    //save
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:deptId forKey:@"DEPT_ID"];
    [defaults synchronize];
}
+(NSString*)loadDepartmentId
{
    //load
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* deptId = [defaults objectForKey:@"DEPT_ID"];
    return deptId;
}

@end
