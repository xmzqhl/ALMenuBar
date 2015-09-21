//
//  MenuBarViewController.m
//  ALMenuBar
//
//  Created by Arien Lau on 14-4-3.
//  Copyright (c) 2014年 Arien Lau. All rights reserved.
//

#import "MenuBarViewController.h"
#import "ALMenuBar.h"

@interface MenuBarViewController () <ALMenuBarDelegate>
@property (nonatomic, retain) ALMenuBar *alMenuBar;
@end

@implementation MenuBarViewController

- (void)dealloc
{
    _alMenuBar.delegate = nil;
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
    ALMenuBarItem *item1 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item2 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item3 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare:)];
    
    image = [UIImage imageNamed:@"iPhone_sinaweibo.png"];
    ALMenuBarItem *item4 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item5 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item6 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare:)];
    
    image = [UIImage imageNamed:@"iPhone_sinaweibo.png"];
    ALMenuBarItem *item7 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item8 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item9 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare:)];
    
    NSArray *items = @[item1, item2, item3, item4, item5, item6, item7, item8, item9];
    if (!_alMenuBar) {
        _alMenuBar = [[ALMenuBar alloc] initWithTitle:@"分享到" items:items];
//        _alMenuBar = [[ALMenuBar alloc] initWithFrame:CGRectZero];
//        [_alMenuBar setTitle:@"分享到"];
//        [_alMenuBar setItems:items];
        _alMenuBar.delegate = self;
    }
    [_alMenuBar ALMenuBarShow];
}

- (void)weiboShare:(ALMenuBarItem *)item
{
    [_alMenuBar ALMenuBarDismiss];
}

- (void)tencentWeoboShare:(ALMenuBarItem *)item
{
    [_alMenuBar ALMenuBarDismiss];
} 

- (void)weixinShare:(ALMenuBarItem *)item
{
    [_alMenuBar ALMenuBarDismiss];
}

//- (void)ALMenuBarDidShown:(ALMenuBar *)menuBar
//{
//    
//}

//- (void)ALMenuBar:(ALMenuBar *)menuBar didSelectIndex:(NSInteger)index
//{
//    [_alMenuBar ALMenuBarDismiss];
//}
//
//- (void)ALMenuBarDidDismiss:(ALMenuBar *)menuBar
//{
//    NSLog(@"%s", __FUNCTION__);
//}
//
//- (void)ALMenuBarWillDismiss:(ALMenuBar *)menuBar
//{
//    NSLog(@"%s", __FUNCTION__);
//}

@end
