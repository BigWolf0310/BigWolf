//
//  TestModel.h
//  TTTest
//
//  Created by  on 2019/11/27.
//  Copyright © 2019 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject

@property (nonatomic, strong) NSString *form1;
@property (nonatomic, assign) CGFloat f1;

@property (nonatomic, strong) NSString *form2;
@property (nonatomic, assign) CGFloat f2;

@property (nonatomic, strong) NSString *text1;
@property (nonatomic, assign) CGFloat t1;

@property (nonatomic, strong) NSString *form3;
@property (nonatomic, assign) CGFloat f3;

@property (nonatomic, strong) NSString *text2;
@property (nonatomic, assign) CGFloat t2;


- (instancetype)initWithForm1:(NSString *)form1 text1:(NSString *)text1 form2:(NSString *)form2 form3:(NSString *)form3 text2:(NSString *)text2;


@end

NS_ASSUME_NONNULL_END
