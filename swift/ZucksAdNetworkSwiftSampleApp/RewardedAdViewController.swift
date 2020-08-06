//
//  RewardedAdViewController.swift
//  ZucksAdNetworkSwiftSampleApp
//
//  Copyright (C) 2020 Zucks, Inc.
//

import UIKit
import ZucksAdNetworkSDK

class RewardedAdViewController: UIViewController {
  private var rewardedAd = ZADNRewardedAd(frameId: "_426be31dad")
  @IBOutlet private weak var loadButton: UIButton!
  @IBOutlet private weak var showButton: UIButton!
  @IBOutlet private weak var indicator: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    rewardedAd.delegate = self
    loadButton.isEnabled = true
    showButton.isEnabled = false
  }
  
  @IBAction private func loadRewardedAd(_ sender: Any) {
    rewardedAd.load()
    loadButton.isEnabled = false
    indicator.startAnimating()
  }

  @IBAction private func showRewardedAd(_ sender: Any) {
    rewardedAd.present(from: self)
    showButton.isEnabled = false
  }
}

extension RewardedAdViewController: ZADNRewardedAdDelegate {
  func rewardedAdDidLoad(_ rewardedAd: ZADNRewardedAd) {
    print("広告ロード完了")
    DispatchQueue.main.async {
      self.showButton.isEnabled = true
      self.indicator.stopAnimating()
    }
  }
  
  func rewardedAd(_ rewardedAd: ZADNRewardedAd, didFailToLoadWithError error: Error) {
    print("広告ロードエラー(\(error))")
    DispatchQueue.main.async {
      self.loadButton.isEnabled = true
      self.indicator.stopAnimating()
    }
  }
  
  func rewardedAdWillAppear(_ rewardedAd: ZADNRewardedAd) {
    print("広告表示直前")
  }
  
  func rewardedAdDidAppear(_ rewardedAd: ZADNRewardedAd) {
    print("広告表示直後")
  }
  
  func rewardedAdWillDisappear(_ rewardedAd: ZADNRewardedAd) {
    print("広告閉じる直前")
  }
  
  func rewardedAdDidDisappear(_ rewardedAd: ZADNRewardedAd) {
    print("広告閉じた直後")
    self.rewardedAd = ZADNRewardedAd(frameId: rewardedAd.frameId)
    self.rewardedAd.delegate = self
    loadButton.isEnabled = true
  }
  
  func rewardedAd(_ rewardedAd: ZADNRewardedAd, didFailToPlayWithError error: Error) {
    print("広告表示エラー(\(error))")
    self.rewardedAd = ZADNRewardedAd(frameId: rewardedAd.frameId)
    self.rewardedAd.delegate = self
    loadButton.isEnabled = true
  }
  
  func rewardedAdShouldReward(_ rewardedAd: ZADNRewardedAd) {
    print("リワード獲得")
  }
}
