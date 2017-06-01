//
//  ZASNativeAdViewController.m
//  ZucksAdNetworkSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

#import "ZASNativeAdViewController.h"
@import ZucksAdNetworkSDK;

@interface ZASNativeAdViewController () <ZADNNativeAdDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *advertiserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkTextLabel;

@end

@implementation ZASNativeAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  // frameID設定(<YOUR_FRAME_ID>の部分は管理画面より発行したFrameIDに置き換えてください)
  ZADNNativeAdLoader *loader = [[ZADNNativeAdLoader alloc] initWithFrameId:@"_305d7dad9a"];
  [loader loadAdWithCompletionHandler:^(ZADNNativeAd * _Nullable nativeAd, NSError * _Nullable error) {
    if (error) {
      switch (error.code) {
        case ZADNNativeAdErrorTypeOffline:
          NSLog(@"native ad load error : offline");
          break;
        case ZADNNativeAdErrorTypeFrameIdUndefined:
          NSLog(@"native ad load error : frame id  undefined");
          break;
        case ZADNNativeAdErrorTypeAdOutOfStock:
          NSLog(@"native ad load error : ad out of stock");
          break;
        case ZADNNativeAdErrorTypeOtherError:
          NSLog(@"native ad load error : other error");
          break;
        default:
          NSLog(@"native ad load error : unexpected");
          break;
      }
      return;
    }

    nativeAd.delegate = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:nativeAd.imageUrl]];
      dispatch_async(dispatch_get_main_queue(), ^{
        self.mainImageView.image = image;
      });
    });
    
    self.titleLabel.text = nativeAd.title;
    self.bodyTextLabel.text = nativeAd.bodyText;
    self.productNameLabel.text = nativeAd.productName;
    self.advertiserNameLabel.text = nativeAd.advertiserName;
    self.linkTextLabel.text = nativeAd.linkButtonText;
    
    [nativeAd apply:self.linkTextLabel];
    
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ZADNNativeAdDelegate methods
- (void)nativeAdDidTapAd:(ZADNNativeAd *)nativeAd {
  NSLog(@"native ad tap");
}


@end
