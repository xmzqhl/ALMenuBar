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
 @brief 初始化视图
 @param title 视图标题
 @param items 一个可变数组，里面存放的是ALMenuBarItem对象。
 */
- (instancetype)initWithTitle:(NSString *)title items:(NSMutableArray *)items;

/**
 设置视图标题
 @attention 如果未使用initWithTitle:items:方法初始化视图，或者你想更改标题的时候使用
 */
- (void)setTitle:(NSString *)title;

/**
 设置item
 @param items 一个可变的数组，里面存放ALMenuBarItem对象
 @attention 如果未使用initWithTitle:items:方法初始化视图，或者需要修改items的时候使用
 */
- (void)setItems:(NSMutableArray *)items;

/**
 显示视图
 */
- (void)ALMunuBarShow;

/**
 移除视图
 */
- (void)ALMunuBarDismiss;

@end

@interface ALMenuBarItem : UIView

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) id        target;
@property (nonatomic)         SEL       action;

/**
 @brief 初始化视图，这是唯一的初始化方式。
 @param title 视图的标题
 @param image 视图要显示的图片
 @param target 点击视图后，消息的接受者，如果target实现了ALMenuBarDelegate，可以为nil。
 @param action 给target发送的消息名称，如果target实现了ALMenuBarDelegate，可以为nil。
 @return ALMenuBarItem对象
 */
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

@end