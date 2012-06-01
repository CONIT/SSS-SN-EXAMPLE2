//
//  DepartmentData.h
//  SSS-SN-EXAMPLE2
//
//  Created by sasaki on 12/06/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DepartmentData : NSObject
{
}
+(NSArray*) departmentNameArray;
+(NSArray*) departmentTagIDArray;
+(void)saveDepartmentId:(NSString*) deptId;
+(NSString*)loadDepartmentId;
@end
