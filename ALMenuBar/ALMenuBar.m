//
//  ALMenuBar.m
//  UIMenuBarTest
//
//  Created by Arien Lau on 14-4-2.
//  Copyright (c) 2014年 Arien Lau. All rights reserved.
//

#import "ALMenuBar.h"
#import "ALMenuBarItem.h"

static CGFloat kDefaultHeight = 240.0f;
static CGFloat kDefaultHalfHeight = 130;
static CGFloat kTitleLabelHeight = 40.0f;
static NSInteger kDefaultItemsNumberInOnePage = 6;
static CGFloat kDefaultPageControlHeight = 20.0;
static CGFloat kDefaultItemSize = 90.0f;
static CGFloat kDefaultTitleFontSize = 16.0f;
#define kDefaultAnimationDuration 0.3f

@interface ALMenuBar ()<UIScrollViewDelegate>
@property (nonatomic, retain) NSMutableArray *menuBarItems;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) UIView *coverView;
@end

@implementation ALMenuBar

- (void)dealloc
{
    for (ALMenuBarItem* item in _menuBarItems) {
        [item removeFromSuperview];
    }
#if !__has_feature(objc_arc)
    [_menuBarItems release]; _menuBarItems = nil;
    [_scrollView release]; _scrollView = nil;
    [_titleLabel release]; _titleLabel = nil;
    [_pageControl release]; _pageControl = nil;
    [_coverView release];  _coverView = nil;
    [super dealloc];
#endif
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title items:(NSMutableArray *)items
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.8;
        CGRect frame = [UIScreen mainScreen].bounds;
        self.frame = CGRectMake(0, 0, frame.size.width, kDefaultHeight);
        
        _menuBarItems = [[NSMutableArray alloc] initWithArray:items];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kTitleLabelHeight)];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
        _titleLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _titleLabel.layer.borderWidth = 1.0f;
        [self addSubview:_titleLabel];
        
        [self initCommonUI];
        [self resetSubviewLayout];
    }
    return self;
}

- (void)initCommonUI
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kTitleLabelHeight, self.frame.size.width, self.frame.size.height - kDefaultPageControlHeight - kTitleLabelHeight)];
    
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _scrollView.scrollEnabled = ([self totalPages] > 1);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    if ([self totalPages] > 1) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, self.frame.size.height - kDefaultPageControlHeight, self.frame.size.width, kDefaultPageControlHeight);
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = [self totalPages];
        [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
    }
}

- (void)changePage:(UIPageControl *)pageControl
{
    NSInteger page = pageControl.currentPage;
    __block typeof(_scrollView) blockScrollView = _scrollView;
    [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
        blockScrollView.contentOffset = CGPointMake(page * _scrollView.frame.size.width, 0);
    }];
}

- (void)resetSubviewLayout
{
    if(_menuBarItems.count == 0) {
        return;
    }
    if (_pageControl) {
        _pageControl.numberOfPages = [self totalPages];
        _pageControl.currentPage = 0;
    }
   
    [self resetScrollViewLayout];
    
    if (_menuBarItems.count == 1) {
        [self setSingalItemFrame];
    } else if (_menuBarItems.count == 2) {
        [self setDoubleItemFrame];
    } else {
        [self setItemsFrame];
    }
}

- (void)addTapGestureToMenuBar:(ALMenuBarItem *)item
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ALMenuBarDidTaped:)];
    [item addGestureRecognizer:tap];
#if !__has_feature(objc_arc)
    [tap release];
#endif
}

- (void)setSingalItemFrame
{
    ALMenuBarItem *menuBarItem = [_menuBarItems objectAtIndex:0];
    menuBarItem.index = 0;
    [self addTapGestureToMenuBar:menuBarItem];
    menuBarItem.frame = CGRectMake((_scrollView.frame.size.width - kDefaultItemSize) / 2.0, 0, kDefaultItemSize, kDefaultItemSize);
    [_scrollView addSubview:menuBarItem];
}

- (void)setDoubleItemFrame
{
    CGFloat totalMargin = _scrollView.frame.size.width - 2 * kDefaultItemSize;
    CGFloat margin = totalMargin / 3.0;
    for (int num = 0; num < _menuBarItems.count; num++) {
        ALMenuBarItem *menuBarItem = [_menuBarItems objectAtIndex:num];
        menuBarItem.index = num;
        [self addTapGestureToMenuBar:menuBarItem];
        menuBarItem.frame = CGRectMake(margin + num * (kDefaultItemSize + margin) , 0, kDefaultItemSize, kDefaultItemSize);
        [_scrollView addSubview:menuBarItem];
    }
}

- (void)setItemsFrame
{
    for(int page = 0; page < [self totalPages]; page++) {
        for(int index = (page * 6); index < (page * 6 + 6); index++) {
            if (index == _menuBarItems.count) {
                break;
            }
            ALMenuBarItem *menuBarItem = [_menuBarItems objectAtIndex:index];
            menuBarItem.index= index;
            [self addTapGestureToMenuBar:menuBarItem];
            int relativeIndex = index - (page * 6);
            int row = (relativeIndex / 3 < 1) ? 0 : 1; /**< 行数*/
            int coloumn = (relativeIndex % 3); /**< 列数*/
            
            int totalInterval = self.frame.size.width - 3 * kDefaultItemSize;
            menuBarItem.frame = CGRectMake(coloumn * (kDefaultItemSize + totalInterval / 2) + page * _scrollView.frame.size.width, row * kDefaultItemSize, kDefaultItemSize, kDefaultItemSize);
            [_scrollView addSubview:menuBarItem];
        }
    }
}

- (void)resetScrollViewLayout
{
    if (_menuBarItems.count <= 3) {
        
        self.frame = CGRectMake(self.frame.origin.x,
                                self.frame.origin.y,
                                self.frame.size.width,
                                kDefaultHalfHeight);
    } else {
        self.frame = CGRectMake(self.frame.origin.x,
                                self.frame.origin.y,
                                self.frame.size.width,
                                kDefaultHeight);
    }
    
    if ([self totalPages] > 1) {
        _scrollView.frame = CGRectMake(0,
                                       kTitleLabelHeight,
                                       self.bounds.size.width,
                                       self.bounds.size.height - kDefaultPageControlHeight - kTitleLabelHeight);
    } else {
        _scrollView.frame = CGRectMake(0,
                                          kTitleLabelHeight,
                                          self.bounds.size.width,
                                          self.bounds.size.height - kTitleLabelHeight);
    }
    
    _scrollView.contentSize = CGSizeMake([self totalPages] * _scrollView.bounds.size.width,
                                            _scrollView.bounds.size.height);

}

- (void)layoutSubviews
{
    [self resetScrollViewLayout];
}

- (NSInteger)totalPages
{
    return ((_menuBarItems.count / kDefaultItemsNumberInOnePage) + 1);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_pageControl) {
        CGPoint offset = scrollView.contentOffset;
        _pageControl.currentPage = offset.x / _scrollView.bounds.size.width;
    }
}

- (void)ALMenuBarDidTaped:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded && [gesture.view isKindOfClass:[ALMenuBarItem class]]) {
        ALMenuBarItem *item = (ALMenuBarItem *)gesture.view;
        if (item.target && item.action && [item.target respondsToSelector:item.action]) {
            [item.target performSelector:item.action withObject:item afterDelay:0];
        }
        
        if ([_delegate respondsToSelector:@selector(ALMenuBar:didSelectIndex:)]) {
            [_delegate ALMenuBar:self didSelectIndex:item.index];
        }
    }
}

- (void)ALMunuBarShow
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    if (![keywindow.subviews containsObject:self]) {
        // Calulate all frames
        CGRect showFrame = CGRectMake(0, keywindow.frame.size.height - self.frame.size.height, keywindow.frame.size.width, self.frame.size.height);
        CGRect leftFrame = CGRectMake(0, 0, keywindow.frame.size.width, keywindow.frame.size.height - self.frame.size.height);
        
        if (!_coverView) {
            _coverView = [[UIView alloc] initWithFrame:keywindow.bounds];
            _coverView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.6];
        }
        [keywindow addSubview:_coverView];
        
        UIControl * dismissButton = [[UIControl alloc] initWithFrame:leftFrame];
        [dismissButton addTarget:self action:@selector(ALMunuBarDismiss) forControlEvents:UIControlEventTouchUpInside];
        dismissButton.backgroundColor = [UIColor clearColor];
        [_coverView addSubview:dismissButton];
#if !__has_feature(objc_arc)
        [dismissButton release];
#endif
        // Present view animated
        self.frame = CGRectMake(0, keywindow.frame.size.height, keywindow.frame.size.width, self.frame.size.height);
        [keywindow addSubview:self];
        
        __block typeof(self) blockSelf = self;
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            blockSelf.frame = showFrame;
        }];
    }
}

- (void)ALMunuBarDismiss
{
    UIWindow * keywindow = [[UIApplication sharedApplication] keyWindow];
    CGRect dismissFrame = CGRectMake(0, keywindow.frame.size.height, self.frame.size.width, self.frame.size.height);
    if (!CGRectEqualToRect(self.frame, dismissFrame)) {
        __block typeof(self) blockSelf = self;
        __block typeof(_coverView) blockCoverView = _coverView;
        if ([_delegate respondsToSelector:@selector(ALMenuBarWillDismiss:)]) {
            [_delegate ALMenuBarWillDismiss:self];
        }
        [UIView animateWithDuration:kDefaultAnimationDuration animations:^{
            blockSelf.frame = dismissFrame;
        } completion:^(BOOL finished) {
            [blockCoverView removeFromSuperview];
            [blockSelf removeFromSuperview];
            if ([_delegate respondsToSelector:@selector(ALMenuBarDidDismiss:)]) {
                [_delegate ALMenuBarDidDismiss:blockSelf];
            }
        }];
    }
}

@end
