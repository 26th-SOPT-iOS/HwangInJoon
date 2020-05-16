//
//  APIConstants.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/05/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
