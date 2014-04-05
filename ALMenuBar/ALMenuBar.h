//
//  ALMenuBar.h
//  UIMenuBarTest
//
//  Created by Arien Lau on 14-4-2.
//  Copyright (c) 2014年 Arien Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALMenuBar;

@protocol ALMenuBarDelegate <NSObject>
@optional
- (void)ALMenuBarWillDismiss:(ALMenuBar *)menuBar;
- (void)ALMenuBarDidDismiss:(ALMenuBar *)menuBar;
- (void)ALMenuBar:(ALMenuBar *)menuBar didSelectIndex:(NSInteger)index;
@end

@interface ALMenuBar : UIView

@property (nonatomic, assign) id<ALMenuBarDelegate>delegate;

/**
 @brief 唯一的初始化视图方式
 @param title 视图标题
 @param items 一个可变数组，里面存放的是ALMenuBarItem对象。
 */
- (instancetype)initWithTitle:(NSString *)title items:(NSMutableArray *)items;
- (void)ALMunuBarDismiss;
- (void)ALMunuBarShow;
@end
