//
//  Data.m
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "Data.h"

@implementation Data
@synthesize Name = _Name;
@synthesize Surname = _Surname;
@synthesize Phone = _Phone;
@synthesize ImageName = _ImageName;

-(id)init:(NSString *)Name Surname:(NSString *)surname Phone:(NSString *)phone ImageName:(NSString *)imageName{
    if(self == [super init]){
        self.Name = Name;
        self.Surname = surname;
        self.Phone = phone;
        self.ImageName = imageName;
    }
    return self;
}

@end
