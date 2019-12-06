//
//  TestTableViewCell.m
//  TTTest
//
//  Created by syt on 2019/11/27.
//

#import "TestTableViewCell.h"

#import "TestModel.h"
#import "Masonry.h"

@interface TestTableViewCell ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *firstWeb;
@property (nonatomic, strong) UIWebView *secondWeb;
@property (nonatomic, strong) UITextView *firstText;
@property (nonatomic, strong) UIWebView *thirdWeb;
@property (nonatomic, strong) UITextView *secondText;

@property (nonatomic, assign) CGFloat webH1;
@property (nonatomic, assign) CGFloat webH2;
@property (nonatomic, assign) CGFloat webH3;

@property (nonatomic, assign) CGFloat textH1;
@property (nonatomic, assign) CGFloat textH2;


@end


@implementation TestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.orangeColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self.contentView addSubview:self.firstWeb];
//    [self.contentView addSubview:self.secondWeb];
//    [self.contentView addSubview:self.firstText];
//    [self.contentView addSubview:self.thirdWeb];
//    [self.contentView addSubview:self.secondText];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self.firstWeb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self.contentView);
//        make.height.mas_equalTo(1);
//    }];
//    [self.secondWeb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.firstWeb.mas_bottom);
//        make.left.right.equalTo(self.firstWeb);
//        make.height.mas_equalTo(1);
//    }];
//    [self.firstText mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.secondWeb.mas_bottom);
//        make.left.right.equalTo(self.firstWeb);
//        make.height.mas_equalTo(self.textH1);
//    }];
//    [self.thirdWeb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.firstText.mas_bottom);
//        make.left.right.equalTo(self.firstWeb);
//        make.height.mas_equalTo(self.webH3);
//    }];
//    [self.secondText mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.thirdWeb.mas_bottom);
//        make.left.right.equalTo(self.firstWeb);
//        make.height.mas_equalTo(self.textH2);
//    }];
}

- (NSInteger)getWebHeight:(NSString *)content
{
    return [[content componentsSeparatedByString:@"<tr>"] count] - 1;
}



- (void)updateContent:(id)data
{
    if ([data isKindOfClass:[TestModel class]]) {
        NSLog(@"更新数据");
        TestModel *model = (TestModel *)data;
        [self.firstWeb loadHTMLString:model.form3 baseURL:nil];
        NSInteger row = [self getWebHeight:model.form3];
        [self.firstWeb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            make.height.mas_equalTo(row * 30);
        }];
//        [self.secondWeb loadHTMLString:model.form2 baseURL:nil];
//        NSAttributedString *attStr1 = [[NSAttributedString alloc] initWithData:[model.text1 dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:YES] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//        self.firstText.attributedText = attStr1;
//        self.textH1 = [self getTextHeight:self.firstText.text];
//        [self.thirdWeb loadHTMLString:model.form3 baseURL:nil];
//        NSAttributedString *attStr2 = [[NSAttributedString alloc] initWithData:[model.text2 dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:YES] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//        self.secondText.attributedText = attStr2;
//        self.textH2 = [self getTextHeight:self.secondText.text];

    }
}

// 获取高度
- (CGFloat)getTextHeight:(NSString *)text
{
    CGRect frame = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:nil
                                      context:nil];
    return frame.size.height;
}




#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"再走此步？？？？？？");
    if (webView == self.firstWeb) {
        CGFloat webViewHeight = [[self.firstWeb stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] integerValue] + 15;
        NSLog(@"height1 = %f", webViewHeight);
        self.webH1 = webViewHeight;
        [self updateContaner];
    } else if (webView == self.secondWeb) {
        CGFloat webViewHeight = [[self.secondWeb stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] integerValue] + 15;
        NSLog(@"height2 = %f", webViewHeight);
        self.webH2 = webViewHeight;
        NSLog(@"textH1 = %f", self.textH1);
        [self updateContaner];
    } else if (webView == self.thirdWeb) {
        CGFloat webViewHeight = [[self.thirdWeb stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] integerValue] + 15;
        NSLog(@"height3 = %f", webViewHeight);
        self.webH3 = webViewHeight;
        [self updateContaner];
    }
}

- (void)updateContaner
{
    [self.firstWeb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(self.webH1);
    }];
    [self.secondWeb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstWeb.mas_bottom);
        make.left.right.equalTo(self.firstWeb);
        make.height.mas_equalTo(self.webH2);
    }];
    [self.firstText mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondWeb.mas_bottom);
        make.left.right.equalTo(self.firstWeb);
        make.height.mas_equalTo(self.textH1);
    }];
    [self.thirdWeb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstText.mas_bottom);
        make.left.right.equalTo(self.firstWeb);
        make.height.mas_equalTo(self.webH3);
    }];
    [self.secondText mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thirdWeb.mas_bottom);
        make.left.right.equalTo(self.firstWeb);
        make.height.mas_equalTo(self.textH2);
    }];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"context = %@", context);
    NSLog(@"keyPath = %@", keyPath);
    if ([keyPath isEqualToString:@"contentSize"]) {
        CGSize size = [[change valueForKey:NSKeyValueChangeNewKey] CGSizeValue];
        NSLog(@"监控：height1 = %f", size.height);
        self.webH1 = size.height;
    } else
    if ([keyPath isEqualToString:@"contentSize2"]) {
        CGSize size = [[change valueForKey:NSKeyValueChangeNewKey] CGSizeValue];
        NSLog(@"监控：height2 = %f", size.height);
        self.webH2 = size.height;
    } else
    if ([keyPath isEqualToString:@"contentSize3"]) {
        CGSize size = [[change valueForKey:NSKeyValueChangeNewKey] CGSizeValue];
        NSLog(@"监控：height3 = %f", size.height);
        self.webH3 = size.height;
    }
    [self updateContaner];
}




- (UIWebView *)firstWeb
{
    if (!_firstWeb) {
        _firstWeb = [[UIWebView alloc] init];
        _firstWeb.backgroundColor = UIColor.whiteColor;
        _firstWeb.scrollView.bounces = NO;
//        _firstWeb.delegate = self;
        _firstWeb.scrollView.showsVerticalScrollIndicator = NO;
    }
    return _firstWeb;
}

- (UIWebView *)secondWeb
{
    if (!_secondWeb) {
        _secondWeb = [[UIWebView alloc] init];
        _secondWeb.backgroundColor = UIColor.whiteColor;
        _secondWeb.scrollView.bounces = NO;
        _secondWeb.delegate = self;
        _secondWeb.scrollView.showsVerticalScrollIndicator = NO;
        [_secondWeb.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:@"secondWeb"];
    }
    return _secondWeb;
}

- (UITextView *)firstText
{
    if (!_firstText) {
        _firstText = [[UITextView alloc] init];
        // WithFrame:CGRectMake(0, CGRectGetMaxY(self.secondWeb.frame), [UIScreen mainScreen].bounds.size.width, 1)
        _firstText.backgroundColor = UIColor.greenColor;
        _firstText.userInteractionEnabled = NO;
        _firstText.textContainerInset = UIEdgeInsetsMake(3, 5, 0, 5);
//        _firstText.textContainerInset = UIEdgeInsetsZero;
//        _firstText.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _firstText.textContainer.lineFragmentPadding = 0;
    }
    return _firstText;
}

- (UIWebView *)thirdWeb
{
    if (!_thirdWeb) {
        _thirdWeb = [[UIWebView alloc] init];
        _thirdWeb.backgroundColor = UIColor.whiteColor;
        _thirdWeb.scrollView.bounces = NO;
        _thirdWeb.delegate = self;
        _thirdWeb.scrollView.showsVerticalScrollIndicator = NO;
        [_thirdWeb.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:@"thirdWeb"];
    }
    return _thirdWeb;
}

- (UITextView *)secondText
{
    if (!_secondText) {
        _secondText = [[UITextView alloc] init];
        // WithFrame:CGRectMake(0, CGRectGetMaxY(self.thirdWeb.frame), [UIScreen mainScreen].bounds.size.width, 1)
        _secondText.backgroundColor = UIColor.greenColor;
        _secondText.userInteractionEnabled = NO;
        _secondText.textContainerInset = UIEdgeInsetsMake(3, 5, 0, 5);
        _secondText.textContainer.lineFragmentPadding = 0;
    }
    return _secondText;
}










- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
