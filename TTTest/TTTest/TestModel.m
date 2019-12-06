
//
//  TestModel.m
//  TTTest
//
//  Created by  on 2019/11/27.
//  Copyright © 2019 . All rights reserved.
//

#import "TestModel.h"

@interface TestModel ()


@end

@implementation TestModel


- (instancetype)initWithForm1:(NSString *)form1 text1:(NSString *)text1 form2:(NSString *)form2 form3:(NSString *)form3 text2:(NSString *)text2
{
    self = [super init];
    if (self) {
        self.form1 = form1;
        self.text1 = text1;
        self.form2 = form2;
        self.form3 = form3;
        self.text2 = text2;
    }
    return self;
}


- (CGFloat)f1
{
    if (!_f1) {
        if (self.form1) {
            
        }
    }
    return _f1;
}








@end
