//
//  UIView+Category.h
//  Test
//
//  Created by JefferyWan on 2019/4/4.
//  Copyright © 2019 JefferyWan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DirectionType) {
    DirectionTypeLeftToRight = 0,
    DirectionTypeTopToBottom
};



@interface UIView (Category)

/** 返回视图的视图控制器(可能为nil) */
@property (nullable, nonatomic, readonly) UIViewController *viewController;
/** left: frame.origin.x */
@property (nonatomic) CGFloat x;
/** top: frame.origin.y */
@property (nonatomic) CGFloat y;
/** right: frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;
/** bottom: frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;
/** width: frame.size.width */
@property (nonatomic) CGFloat width;
/** height: frame.size.height */
@property (nonatomic) CGFloat height;
/** centerX: center.x */
@property (nonatomic) CGFloat centerX;
/** centerY: center.y */
@property (nonatomic) CGFloat centerY;
/** origin: frame.origin */
@property (nonatomic) CGPoint origin;
/** size: frame.size */
@property (nonatomic) CGSize  size;

- (CGFloat)maxX;
- (CGFloat)maxY;


/** 设置view的渐变色 */
- (void)setGradientColor:(UIColor *)fromColor toColor:(UIColor *)toColor direction:(DirectionType)direction;

/**
 *  设置部分圆角(绝对布局)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
               withRadius:(CGSize)radius;
/**
 *  设置部分圆角(相对布局)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
               withRadius:(CGSize)radius
                 viewRect:(CGRect)rect;

/**
 *  设置视图view的阴影
 */
- (void)setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/** 删除所有子视图 */
- (void)removeAllSubviews;

/** 创建屏幕快照 */
- (nullable UIImage *)snapshotImage;

/** 创建屏幕快照pdf */
- (nullable NSData *)snapshotPDF;

//左右抖动动画
- (void) shakeAnimation;

- (void)removeChildByTag:(int)tag;

- (void)onTapTarget:(id)target action:(SEL)sel;

@end






NS_ASSUME_NONNULL_END
