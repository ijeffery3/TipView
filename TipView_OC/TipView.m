//
//  TipView.m
//  SomeThing
//
//  Created by Jefery on 2020/7/30.
//  Copyright © 2020 Jeffery. All rights reserved.
//

#import "TipView.h"
#import "UIView+Category.h"

@interface TipView ()

@property (nonatomic, strong) UILabel *label;


@end

@implementation TipView

static TipView *instance = nil;

#define contHeight 40
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = contHeight / 2;
        self.superview.clipsToBounds = YES;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        [self addSubview:self.label];
    }
    return self;
}

+ (void)showTipViewWithText:(NSString *)text inView:(UIView *)view
{
    [[self shared] showAnimateWithText:text inView:view];
}

- (void)showAnimateWithText:(NSString *)text inView:(UIView *)view
{
    self.label.text = text;
    CGFloat width = [self labelWidth:text];
    self.frame = CGRectMake( 0, -contHeight,  width,  contHeight);
    self.x = (kScreenWidth - width) / 2;
    self.label.frame = self.bounds;
    [view addSubview:self];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.y = 100;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.4 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.y = -contHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (CGFloat)labelWidth:(NSString *)text
{
    CGSize size = CGSizeMake(CGFLOAT_MAX,contHeight); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: self.label.font};
    CGSize labelSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    if (labelSize.width < 50) {
        return 50;
    }
    return labelSize.width + 20;
}


- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"";
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}


+ (id)allocWithZone:(struct _NSZone*)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });    return instance;
}
@end
