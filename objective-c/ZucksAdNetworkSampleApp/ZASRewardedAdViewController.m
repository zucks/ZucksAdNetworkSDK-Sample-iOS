//
//  ZASRewardedAdViewController.m
//  ZucksAdNetworkSampleApp
//
//  Copyright (C) 2020 Zucks, Inc.
//

#import "ZASRewardedAdViewController.h"

@import ZucksAdNetworkSDK;

@interface ZASRewardedAdViewController () <ZADNRewardedAdDelegate>

@property (nonatomic) ZADNRewardedAd *rewardedAd;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation ZASRewardedAdViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.rewardedAd = [[ZADNRewardedAd alloc] initWithFrameId:@"_426be31dad"];
  self.rewardedAd.delegate = self;
  [self.loadButton setEnabled:YES];
  [self.showButton setEnabled:NO];
}

- (IBAction)loadRewardedAd:(id)sender {
  [self.rewardedAd loadAd];
  [self.loadButton setEnabled:NO];
  [self.indicator startAnimating];
}

- (IBAction)showRewardedAd:(id)sender {
  [self.rewardedAd presentAdFromViewController:self];
  [self.showButton setEnabled:NO];
}

#pragma mark - ZADNRewardedAdDelegate
- (void)rewardedAdDidLoad:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"広告ロード完了");
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.showButton setEnabled:YES];
    [self.indicator stopAnimating];
  });
}

- (void)rewardedAd:(ZADNRewardedAd *)rewardedAd didFailToLoadWithError:(NSError *)error {
  NSLog(@"広告ロードエラー(%@)", error);
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.loadButton setEnabled:YES];
    [self.indicator stopAnimating];
  });
}

- (void)rewardedAdWillAppear:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"広告表示直前");
}
 
- (void)rewardedAdDidAppear:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"広告表示直後");
}

- (void)rewardedAdWillDisappear:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"広告閉じる直前");
}

- (void)rewardedAdDidDisappear:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"広告閉じた直後");
  self.rewardedAd = [[ZADNRewardedAd alloc] initWithFrameId:rewardedAd.frameId];
  [self.loadButton setEnabled:YES];
}

- (void)rewardedAd:(ZADNRewardedAd *)rewardedAd didFailToPlayWithError:(NSError *)error {
  NSLog(@"広告表示エラー(%@)", error);
  self.rewardedAd = [[ZADNRewardedAd alloc] initWithFrameId:rewardedAd.frameId];
  [self.loadButton setEnabled:YES];
}

- (void)rewardedAdShouldReward:(ZADNRewardedAd *)rewardedAd {
  NSLog(@"リワード獲得");
}

@end
