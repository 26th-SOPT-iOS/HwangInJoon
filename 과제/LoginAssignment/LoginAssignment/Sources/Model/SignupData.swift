//
//  SignupData.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/05/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

struct SigupData: Codable {
    var status: Int
    var success: Bool
    var message: String
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
    
}

//{
//    "id": "gng",
//    "password": "qwerty",
//    "name": "In jun",
//    "email": "aaaa@gmail.com",
//    "phone": "000-0000-0000"
//}
