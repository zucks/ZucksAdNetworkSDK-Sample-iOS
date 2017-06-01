//
//  NativeAdViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
// Copyright (C) 2016 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class NativeAdViewController: UIViewController {

  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyTextLabel: UILabel!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var advertiserNameLabel: UILabel!
  @IBOutlet weak var linkTextLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let loader = ZADNNativeAdLoader(frameId: "_305d7dad9a")
    loader.loadAd { nativeAd, error in
      switch (nativeAd, error) {
      case (_, let error as NSError):
        let errorCode = ZADNNativeAdErrorType(rawValue: error.code)!
        switch errorCode {
        case ZADNNativeAdErrorType.offline:
          print("native ad load error : offline")
        case ZADNNativeAdErrorType.frameIdUndefined:
          print("native ad load error : frame id undefined")
        case ZADNNativeAdErrorType.adOutOfStock:
          print("native ad load error : ad out of stock")
        case ZADNNativeAdErrorType.otherError:
          print("native ad load error : other error")
        }
      case (let nativeAd?, _):
        nativeAd.delegate = self

        if let imageUrl = nativeAd.imageUrl {
          DispatchQueue.global().async {
            if let image = try? UIImage(data: Data(contentsOf: imageUrl)) {
              DispatchQueue.main.async {
                self.mainImageView.image = image
              }
            }
          }
        }

        self.titleLabel.text = nativeAd.title
        self.bodyTextLabel.text = nativeAd.bodyText
        self.productNameLabel.text = nativeAd.productName
        self.advertiserNameLabel.text = nativeAd.advertiserName
        self.linkTextLabel.text = nativeAd.linkButtonText
        
        nativeAd.apply(self.linkTextLabel)
      default:
        print("invalid response")
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension NativeAdViewController: ZADNNativeAdDelegate {
  func nativeAdDidTap(_ nativeAd: ZADNNativeAd) {
    print("native ad tap");
  }
}
