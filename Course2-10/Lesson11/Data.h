//
//  Data.h
//  Lesson11
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject{
    NSString *_Name;
    NSString *_Surname;
    NSString *_Phone;
    NSString *_ImageName;
    
}
@property(nonatomic , copy) NSString *Name;
@property(nonatomic , copy) NSString *Surname;
@property(nonatomic , copy) NSString *Phone;
@property(nonatomic , copy) NSString *ImageName;
-(id)init:(NSString *)Name Surname:(NSString *)surname Phone:(NSString *)phone ImageName:(NSString *)imageName;


@end
