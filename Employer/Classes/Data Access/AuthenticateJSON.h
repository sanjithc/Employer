//
//  AuthenticateJSON.h
//  Employer
//
//  Created by Sanjit Janak Nair on 19/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthenticateJSON : NSObject
@property (nonatomic,strong) NSMutableData *resp;
- (void) CallWebService;
@end
