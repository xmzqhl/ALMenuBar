//
//  ALMenuBarItem.m
//  UIMenuBarTest
//
//  Created by Arien Lau on 14-4-2.
//  Copyright (c) 2014年 Arien Lau. All rights reserved.
//

#import "ALMenuBarItem.h"

static CGFloat kTitleLabelHeight = 25.0f;
static CGFloat kBottomMargin = 10.0f;

@interface ALMenuBarItem ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain)UILabel *titleLabel;

@end

@implementation ALMenuBarItem

- (void)dealloc
{
     NSLog(@"%s", __FUNCTION__);
#if !__has_feature(objc_arc)
    [_imageView release]; _imageView = nil;
    [_titleLabel release]; _titleLabel = nil;
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

- (id)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _target = target;
        _action = action;
        
        _imageView = [[UIImageView alloc] init];
        _imageView.image = image;
        _imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_imageView];
    
        _titleLabel = [[UILabel alloc] init] ;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = title;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    CGSize size = _imageView.image.size;
    _imageView.frame = CGRectMake((self.frame.size.width - size.width) / 2.0, (self.frame.size.height - size.height - kTitleLabelHeight) / 2.0, size.width, size.height);
    _titleLabel.frame = CGRectMake(0, self.frame.size.height - kTitleLabelHeight - kBottomMargin, self.frame.size.width, kTitleLabelHeight);
}

@end
