//
//  TipView.h
//  SomeThing
//
//  Created by Jefery on 2020/7/30.
//  Copyright © 2020 Jeffery. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TipView : UIView

+ (instancetype)shared;


+ (void)showTipViewWithText:(NSString *)text inView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
