//
//  MenuBarViewController.m
//  ALMenuBar
//
//  Created by Arien Lau on 14-4-3.
//  Copyright (c) 2014年 Arien Lau. All rights reserved.
//

#import "MenuBarViewController.h"
#import "ALMenuBar.h"
#import "ALMenuBarItem.h"

@interface MenuBarViewController ()<ALMenuBarDelegate>
@property (nonatomic, retain) ALMenuBar *alMenuBar;
@end

@implementation MenuBarViewController

- (void)dealloc
{
    _alMenuBar.delegate = nil;
#if !__has_feature(objc_arc)
    [_alMenuBar release]; _alMenuBar = nil;
    [super dealloc];
#endif
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake((CGRectGetWidth(self.view.bounds) - 70 ) / 2.0, 200, 70, 40);
    [button setTitle:@"show" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showMenuBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenuBar
{
    UIImage *image = [UIImage imageNamed:@"iPhone_sinaweibo.png"];
    ALMenuBarItem *item1 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare)];
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item2 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare)];
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item3 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare)];
    ALMenuBarItem *item4 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare)];
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item5 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare)];
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item6 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare)];
    ALMenuBarItem *item7 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare)];
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item8 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare)];
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item9 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare)];
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:item1];
    [items addObject:item2];
    [items addObject:item3];
    [items addObject:item4];
    [items addObject:item5];
    [items addObject:item6];
    [items addObject:item7];
    [items addObject:item8];
    [items addObject:item9];
    
    if (!_alMenuBar) {
        _alMenuBar = [[ALMenuBar alloc] initWithTitle:@"分享到" items:items];
        _alMenuBar.delegate = self;
    }
    [_alMenuBar ALMunuBarShow];
#if !__has_feature(objc_arc)
    [item1 release];
    [item2 release];
    [item3 release];
    [item4 release];
    [item5 release];
    [item6 release];
    [item7 release];
    [item8 release];
    [item9 release];
#endif
}

- (void)weiboShare
{
    [_alMenuBar ALMunuBarDismiss];
}

- (void)tencentWeoboShare
{
    [_alMenuBar ALMunuBarDismiss];
}

- (void)weixinShare
{
    [_alMenuBar ALMunuBarDismiss];
}

//- (void)ALMenuBar:(ALMenuBar *)menuBar didSelectIndex:(NSInteger)index
//{
//    [_alMenuBar ALMunuBarDismiss];
//}

//- (void)ALMenuBarDidDismiss:(ALMenuBar *)menuBar
//{
//
//}

@end
