//
//  NoticeModel.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/06/09.
//  Copyright © 2020 jun. All rights reserved.
//

//"status": 200,
//   "success": true,
//   "message": "공지사항 조회 성공",
//   "data": [
//       {
//           "notice_idx": 1,
//           "notice_title": "공지사항 입니다!"
//       },
//       {
//           "notice_idx": 2,
//           "notice_title": "NOTICE OF SOPT"
//       },
//       {
//           "notice_idx": 3,
//           "notice_title": "THE CAMP의 공지"
//       }
//   ]



import Foundation

struct NoticeModel: Codable {
    
    struct Data: Codable {
        let noticeidx: Int
        let noticetitle: String
        enum CodingKeys: String, CodingKey {
            case noticeidx = "notice_idx"
            case noticetitle = "notice_title"
        }
    }
    
    var success: Bool
    var message: String
    var data: [Data]
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case message = "message"
        case data = "data"
        
    }
}
