//
//  ViewController.h
//  CometChatSample
//
//  Created by aditya gokula on 18/05/18.
//  Copyright © 2018 Inscripts (I) Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageSDKFramework/CometChat.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnInitializeChat;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginSuperHero1;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginSuperHero2;
@property (weak, nonatomic) IBOutlet UIButton *btnLaunchChat;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *pbLoading;
@property (strong, nonatomic) CometChat* cometChat;
@end

