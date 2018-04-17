//
//  MyTabBarController.m
//  WeiXin
//
//  Created by Yuan on 2018/4/16.
//  Copyright © 2018年 Yuan. All rights reserved.
#import "MyTabBarController.h"
#import "MyNavController.h"
#import "ZMColor.h"

/********************* 图标和子控制器 **************************/

#define Controller @"ChatViewController,MessiageViewController,DiscoverViewController,MeViewController"
#define Title      @"微信,通讯录,发现,我"
#define Image      @"tabbar_mainframe,tabbar_contacts,tabbar_discover,tabbar_me"
#define SelectImage @"tabbar_mainframeHL,tabbar_mainframeHL,tabbar_discoverHL,tabbar_meHL"
@interface MyTabBarController ()<UITabBarControllerDelegate>
@end

@implementation MyTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.delegate = self;
    
    [self addDcChildViewContorller];
    self.selectedIndex=0;
    
    
}

// 添加控制器
-(void)addDcChildViewContorller
{
    NSArray * VC=[Controller componentsSeparatedByString:@","];
    NSArray * TL=[Title componentsSeparatedByString:@","];
    NSArray * IG=[Image componentsSeparatedByString:@","];
    NSArray * SG=[SelectImage componentsSeparatedByString:@","];
    for (int i=0; i<VC.count; i++) {
          [self addChildVc:[NSClassFromString(VC[i]) new] title:TL[i] image:IG[i] selectedImage:SG[i]];
    }
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MyNavController *nav = [[MyNavController alloc]initWithRootViewController:childVc];
    //设置item按钮
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[ZMColor colorWithRed:136 withGreen:134 withBlue:135 withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[ZMColor appMainColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    
    [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    //nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    //nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    // 添加子控制器
    [self addChildViewController:nav];
}
@end
