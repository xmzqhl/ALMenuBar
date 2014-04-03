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

- (void)ALMenuBarDidDismiss:(ALMenuBar *)menuBar;
- (void)ALMenuBar:(ALMenuBar *)menuBar didSelectIndex:(NSInteger)index;

@end

@interface ALMenuBar : UIView

@property (nonatomic, assign) id<ALMenuBarDelegate>delegate;

- (instancetype)initWithTitle:(NSString *)title items:(NSMutableArray *)items ;
- (void)ALMunuBarDismiss;
- (void)ALMunuBarShow;
@end
