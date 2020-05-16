//
//  NetworkResult.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/05/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
