//
//  TestTableViewCell.h
//  TTTest
//
//  Created by syt on 2019/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^updateCellHeight)(CGFloat height);

- (void)updateContent:(id)data;


@end

NS_ASSUME_NONNULL_END
