ALMenuBar
=========
When your project has the action which sharing something to other social app,you can user this to show the choice,hope you
enjoy it.

###support ARC and MRC
You can use either style in your Cocoa project. ALMenuBar Will figure out which you are using at compile time and do the right thing.


###Usage:
---------
simple like this:
```C:n
	UIImage *image = [UIImage imageNamed:@"iPhone_sinaweibo.png"];
    ALMenuBarItem *item1 = [[ALMenuBarItem alloc] initWithTitle:@"新浪微博" image:image target:self action:@selector(weiboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_tencentweibo.png"];
    ALMenuBarItem *item2 = [[ALMenuBarItem alloc] initWithTitle:@"腾讯微博" image:image target:self action:@selector(tencentWeoboShare:)];
    
    image = [UIImage imageNamed:@"iPhone_weixinShare.png"];
    ALMenuBarItem *item3 = [[ALMenuBarItem alloc] initWithTitle:@"微信" image:image target:self action:@selector(weixinShare:)];
    
    NSMutableArray *items = [NSMutableArray array];
    [items addObject:item1];
    [items addObject:item2];
    [items addObject:item3];
    _alMenuBar = [[ALMenuBar alloc] initWithTitle:@"分享到" items:items];
    [_alMenuBar ALMenuBarShow];
```
if you add nine ALMenuBarItem to the _alMenubar,the interface will like this:
 ![ALMenuBar](https://github.com/wybflb/ALMenuBar/raw/master/example/screenshots/effect.PNG)

