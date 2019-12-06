//
//  ViewController.m
//  TTTest
//
//  Created by  on 2019/10/21.
//  Copyright © 2019 . All rights reserved.
//

#import "ViewController.h"

#import "TestModel.h"
#import "TestTableViewCell.h"

@interface ViewController ()<UIWebViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UITextView *textView;


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) CGFloat cellH;


@end

static NSString *const customerCell = @"customerCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.cellH = 0.0;
#pragma makr - 时间差
//    [self timeValue];
#pragma mark - 登录加密
//    [self loginEncryption];
#pragma mark - 数组去重
//    [self repeatItem];
#pragma mark - 加载Html
//    [self loadHtml];
    
//    [self testTabView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 30);
    button.backgroundColor = UIColor.blueColor;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    [button setTitle:@"更新版本" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)button
{
    NSLog(@"更新版本");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.pgyer.com/CNWG"]];
}

#pragma mark - 时间差
- (void)timeValue
{
    NSString *ssss = [self dateTimeDifferenceWithStartTime:@"2019-11-09 16:00" endTime:@"2019-11-08 15:10"];
    NSLog(@"sss  = %@", ssss);

}
#pragma mark - 登录加密
- (void)loginEncryption
{
    NSString *publicKey = @"30819f300d06092a864886f70d010101050003818d00308189028181009f745ab76d2775780f1ff9934e4031e97b35a7b26d7b909e068934d55909ebc98a13437fb63a254f55a842bc97b95cccca49cda552b7c811e9579f6c8fd221c8c0123dbe954cdf7a9b2f5e683eb7aab38330d3d3318faff6bfd988781922d81ef2ea3dfe4f32efd3551a4fae5336dec149f4c261f8a8ef4660d959eefd26b1e30203010001";
    NSString *encode = [self EncryptRSA:@"123456" PublicKey:publicKey];
    NSLog(@"%@",encode);
}
#pragma mark - 比较时间
- (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970] * 1;
    NSTimeInterval end = [endD timeIntervalSince1970] * 1;
    NSTimeInterval value = end - start;
    int second = (int)value % 60;//秒
    int minute = (int)value /60 % 60;
    int house = (int)value % (24 * 3600) / 3600;
    int day = (int)value / (24 * 3600);
    NSString *str;
    if (day > 0) {
        NSLog(@"超过了24小时");
    } else {
        NSLog(@"在24小时以内");
    }
    if (day != 0) {
        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
    } else if (day == 0 && house != 0) {
        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
    } else if (day== 0 && house== 0 && minute!=0) {
        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
    } else {
        str = [NSString stringWithFormat:@"耗时%d秒",second];
    }
    return str;
}
// 数组去重
- (void)repeatItem
{
    NSArray *aa = @[@"a" , @"2" , @"f", @"1", @"a", @"4", @"5", @"f"];
//    NSSet *set = [NSSet setWithArray:aa];
//    NSLog(@"set = %@", [set allObjects]);
    
     NSArray *result = [aa valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"result = %@", result);
}
// 测试Html
- (void)loadHtml
{
//    NSInteger index = 1;
//    NSString *str = [NSString stringWithFormat:@"<table border=1><tr><th>Month</th><th>Savings</th></tr><tr><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td></tr></table>"];
//    NSString *str = [NSString stringWithFormat:@"<table border=1><tr><th rowSpan=2>Month</th><th colSpan=2>Savings</th><th rowSpan=2>Savings</th></tr><tr><th style=color:red;>Month</th><th>Savings</th></tr><tr><td>1</td><td>$100</td><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td><td>4</td><td>$100</td></tr></table>"];
    NSString *str = @"<table border=1><tr><th rowSpan=2>Month</th><th colSpan=2>Savings</th><th rowSpan=2>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th></tr><tr><th style=color:red;>Month</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th></tr><tr><td>1</td><td>$100</td><td>1</td><td>$100</td><td>1</td><td>$100</td><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td><td>2</td><td>$100</td><td>2</td><td>$100</td><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td><td>3</td><td>$100</td><td>3</td><td>$100</td><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td><td>4</td><td>$100</td><td>4</td><td>$100</td><td>4</td><td>$100</td></tr></table>";
    
    NSString *str1 = @"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是段落。呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜<span style=color:red;>科比</span>呜呜呜呜呜呜呜呜呜呜呜呜无</p>";
    
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[str1 dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:YES] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    [self.webView loadHTMLString:str baseURL:nil];
    self.textView.attributedText = attStr;
    
    
}
// 正则去除网络标签
- (NSString *)getZZwithString:(NSString *)string{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n"
                                                                                    options:0
                                                                                      error:nil];
    string=[regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@""];
    return string;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat webViewHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] integerValue] + 15;
    NSLog(@"height = %f", webViewHeight);
    CGRect newFrame = webView.frame;
    newFrame.size.height = webViewHeight;
    webView.frame = newFrame;
    self.textView.frame = CGRectMake(0, CGRectGetMaxY(self.webView.frame), [UIScreen mainScreen].bounds.size.width, [self getTextHeight:self.textView.text]);
    NSLog(@"高度 = %f", [self getTextHeight:self.textView.text]);
}
- (CGFloat)getTextHeight:(NSString *)text
{
    CGRect frame = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:nil
                                              context:nil];
    return frame.size.height;
}
// 测试Test
- (void)testTabView
{
    [self.view addSubview:self.tableView];
}





#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customerCell];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customerCell];
    }
    if (self.dataArray.count > 0) {
        [cell updateContent:self.dataArray[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}








- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 1)];
        _webView.backgroundColor = UIColor.whiteColor;
        _webView.scrollView.bounces = NO;
        _webView.delegate = self;
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.webView.frame), [UIScreen mainScreen].bounds.size.width, 1)];
        _textView.backgroundColor = UIColor.greenColor;
        _textView.userInteractionEnabled = NO;
        _textView.textContainerInset = UIEdgeInsetsMake(3, 5, 0, 5);
//        _textView.textContainerInset = UIEdgeInsetsZero;
//        _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _textView.textContainer.lineFragmentPadding = 0;
        [self.view addSubview:_textView];
    }
    return _textView;
}



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:customerCell];
    }
    return _tableView;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        TestModel *model = [[TestModel alloc] initWithForm1:@"<table border=1><tr><th>Month</th><th>Savings</th></tr><tr><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td></tr></table>" text1:@"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是段落。呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜<span style=color:red;>科比</span>呜呜呜呜呜呜呜呜呜呜呜呜无</p>" form2:@"<table border=1><tr><th rowSpan=2>Month</th><th colSpan=2>Savings</th><th rowSpan=2>Savings</th></tr><tr><th style=color:red;>Month</th><th>Savings</th></tr><tr><td>1</td><td>$100</td><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td><td>4</td><td>$100</td></tr></table>" form3:@"<table border=1><tr><th rowSpan=2>Month</th><th colSpan=2>Savings</th><th rowSpan=2>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th></tr><tr><th style=color:red;>Month</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th><th>Savings</th></tr><tr><td>1</td><td>$100</td><td>1</td><td>$100</td><td>1</td><td>$100</td><td>1</td><td>$100</td></tr><tr><td>2</td><td>$100</td><td>2</td><td>$100</td><td>2</td><td>$100</td><td>2</td><td>$100</td></tr><tr><td>3</td><td>$100</td><td>3</td><td>$100</td><td>3</td><td>$100</td><td>3</td><td>$100</td></tr><tr><td>4</td><td>$100</td><td>4</td><td>$100</td><td>4</td><td>$100</td><td>4</td><td>$100</td></tr></table>" text2:@"<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是段落。呜呜呜呜呜呜呜呜呜呜呜呜天天天天提小咋算安时代的师大暨大呜<span style=color:red;>科比</span>呜呜呜呜呜呜呜呜呜呜呜呜无这是段落。呜呜呜呜呜呜呜呜呜呜呜呜天天天天提这是段落。呜呜呜呜呜呜呜呜呜呜呜呜天天天天提</p>"];
        _dataArray = [NSArray arrayWithObject:model];
    }
    return _dataArray;
}





















- (NSString *)EncryptRSA:(NSString *)message PublicKey:(NSString *)pubKey {
    if(message == nil || pubKey == nil) return @"";
    NSData *data = [self encryptData:[message dataUsingEncoding:NSUTF8StringEncoding] publicKey:pubKey];
    return [self convertDataToHexStr:data];
}

- (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey {
    if(!data || !pubKey) return nil;
    SecKeyRef keyRef = [self addPublicKey:pubKey];
    if(!keyRef) return nil;
    return [self encryptData:data withKeyRef:keyRef];
}

- (SecKeyRef)addPublicKey:(NSString *)key {
    NSRange spos = [key rangeOfString:@"-----BEGIN PUBLIC KEY-----"];
    NSRange epos = [key rangeOfString:@"-----END PUBLIC KEY-----"];
    if(spos.location != NSNotFound && epos.location != NSNotFound)
    {
        NSUInteger s = spos.location + spos.length;
        NSUInteger e = epos.location;
        NSRange range = NSMakeRange(s, e-s);
        key = [key substringWithRange:range];
    }
    key = [key stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@" "  withString:@""];
    
    // This will be base64 encoded, decode it.
    NSData *data = [self convertHexStrToData:key];
    if(!data) return nil;
    
    //a tag to read/write keychain storage
    NSString *tag = @"RSAUtil_PubKey";
    NSData *d_tag = [NSData dataWithBytes:[tag UTF8String] length:[tag length]];
    
    // Delete any old lingering key with the same tag
    NSMutableDictionary *publicKey = [[NSMutableDictionary alloc] init];
    [publicKey setObject:(__bridge id) kSecClassKey forKey:(__bridge id)kSecClass];
    [publicKey setObject:(__bridge id) kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [publicKey setObject:d_tag forKey:(__bridge id)kSecAttrApplicationTag];
    SecItemDelete((__bridge CFDictionaryRef)publicKey);
    
    // Add persistent version of the key to system keychain
    [publicKey setObject:data forKey:(__bridge id)kSecValueData];
    [publicKey setObject:(__bridge id) kSecAttrKeyClassPublic forKey:(__bridge id)
     kSecAttrKeyClass];
    [publicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)
     kSecReturnPersistentRef];
    
    CFTypeRef persistKey = nil;
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)publicKey, &persistKey);
    if (persistKey != nil){
        CFRelease(persistKey);
    }
    if ((status != noErr) && (status != errSecDuplicateItem)) {
        return nil;
    }
    
    [publicKey removeObjectForKey:(__bridge id)kSecValueData];
    [publicKey removeObjectForKey:(__bridge id)kSecReturnPersistentRef];
    [publicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
    [publicKey setObject:(__bridge id) kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    
    // Now fetch the SecKeyRef version of the key
    SecKeyRef keyRef = nil;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)publicKey, (CFTypeRef *)&keyRef);
    if(status != noErr){
        return nil;
    }
    return keyRef;
}

- (NSData *)encryptData:(NSData *)data withKeyRef:(SecKeyRef) keyRef {
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    size_t block_size = SecKeyGetBlockSize(keyRef) * sizeof(uint8_t);
    void *outbuf = malloc(block_size);
    size_t src_block_size = block_size - 11;
    
    NSMutableData *ret = [[NSMutableData alloc] init];
    for(int idx=0; idx<srclen; idx+=src_block_size)
    {
        //NSLog(@"%d/%d block_size: %d", idx, (int)srclen, (int)block_size);
        size_t data_len = srclen - idx;
        if(data_len > src_block_size)
        {
            data_len = src_block_size;
        }
        size_t outlen = block_size;
        OSStatus status = noErr;
        status = SecKeyEncrypt(keyRef, kSecPaddingPKCS1, srcbuf + idx, data_len, outbuf, &outlen);
        if (status != 0) {
            NSLog(@"SecKeyEncrypt fail. Error Code: %d", status);
            ret = nil;
            break;
        }
        else{
            [ret appendBytes:outbuf length:outlen];
        }
    }
    
    free(outbuf);
    CFRelease(keyRef);
    return ret;
}

- (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) return nil;
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0)
    {
        range = NSMakeRange(0, 2);
    }
    else
    {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2)
    {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

- (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) return @"";
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++)
        {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [result appendString:hexStr];
            } else {
                [result appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return result;
}





@end
