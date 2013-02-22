//
//  WebConnector.h
//  Employer
//
//  Created by Sanjit Janak Nair on 18/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authenticate : NSObject

@property (weak,nonatomic) NSString *UserName;
@property (weak,nonatomic) NSString *Password;
@property NSString *RID;
- (NSString*) AuthenticateMe: (NSString*) UID : (NSString*) Password;


@end
