//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by Navi Budhraja on 6/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate{
    func didUpdateCoin(rate: Double)
    func didFailWithError(error: Error)
}
