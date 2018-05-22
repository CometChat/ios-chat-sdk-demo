//
//  ViewController.m
//  CometChatSample
//
//  Created by aditya gokula on 18/05/18.
//  Copyright © 2018 Inscripts (I) Private Limited. All rights reserved.
//

#import "ViewController.h"
#import <cometchat-ui/readyUIFIle.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnInitializeChat = _btnInitializeChat;
@synthesize btnLoginSuperHero1 = _btnLoginSuperHero1;
@synthesize btnLoginSuperHero2 = _btnLoginSuperHero2;
@synthesize btnLaunchChat = _btnLaunchChat;
@synthesize pbLoading = _pbLoading;
@synthesize cometChat = _cometChat;
NSString * const licenseKey = @"COMETCHAT-XXXXX-XXXXX-XXXXX-XXXXX"; // Replace this value with your CometChat License Key
NSString * const apiKey = @"xxxxxxxxxxxxxxxxxxxxxx"; // Replace the value with your CometChat Api Key;
NSString * const UID1 = @"SUPERHERO1";
NSString * const UID2 = @"SUPERHERO2";
BOOL isCometOnDemand = YES; // For CometChat Cloud Users, Please set this to true

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cometChat = [[CometChat alloc]init];
    [self setupListeners];
    
    
    
}

-(void) setupListeners {
    [_btnInitializeChat addTarget:self action:@selector(initializeChat) forControlEvents:UIControlEventTouchUpInside];
    [_btnLoginSuperHero1 addTarget:self action:@selector(loginWithSuperHero1) forControlEvents:UIControlEventTouchUpInside];
    [_btnLoginSuperHero2 addTarget:self action:@selector(loginWithSuperHero2) forControlEvents:UIControlEventTouchUpInside];
    [_btnLaunchChat addTarget:self action:@selector(launchChat) forControlEvents:UIControlEventTouchUpInside];
}

-(void) initializeChat {
    [self showLoading:YES];
    [self.cometChat initializeCometChat:@"" licenseKey:licenseKey apikey:apiKey isCometOnDemand:isCometOnDemand success:^(NSDictionary *response) {
        NSLog(@"CometChat Initialized");
        self.btnLoginSuperHero1.enabled = YES;
        self.btnLoginSuperHero2.enabled = YES;
        [self showLoading:NO];
        
    } failure:^(NSError *error) {
        NSLog(@"CometChat Initialization Failed");
        [self showLoading:NO];
    }];
}

-(void) loginWithSuperHero1{
    [self showLoading:YES];
    [self.cometChat loginWithUID:UID1 success:^(NSDictionary *response) {
        NSLog(@"Login Successful");
        self.btnLaunchChat.enabled = YES;
        [self showLoading:NO];
    } failure:^(NSError *error) {
        NSLog(@"Login Failed");
        [self showLoading:NO];
    }];
}

-(void) loginWithSuperHero2{
    [self showLoading:YES];
    [self.cometChat loginWithUID:UID2 success:^(NSDictionary *response) {
        NSLog(@"Login Successful");
        self.btnLaunchChat.enabled = YES;
        [self showLoading:NO];
    } failure:^(NSError *error) {
        NSLog(@"Login Failed");
        [self showLoading:NO];
    }];
}

-(void) launchChat {
    BOOL isFullScreen = YES;
    [self showLoading:YES];
    readyUIFIle* readyUIFile1 = [[readyUIFIle alloc]init];
    [readyUIFile1 launchCometChat:isFullScreen observer:self userInfo:^(NSDictionary *response) {
        
    } groupInfo:^(NSDictionary *response) {
        
    } onMessageReceive:^(NSDictionary *response) {
        
    } success:^(NSDictionary *response) {
        
    } failure:^(NSError *error) {
        
    } onLogout:^(NSDictionary *response) {
        
    } ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showLoading:(BOOL) show{
    if(show){
        _pbLoading.hidden = NO;
    }else{
        _pbLoading.hidden = YES;
    }
}


@end
