//
//  SoldierModel.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/06/09.
//  Copyright © 2020 jun. All rights reserved.
//




//"status": 200,
//"success": true,
//"message": "병사정보 조회 성공",
//"data": [
//{
//"soldier_idx": 1,
//"join_date": "2019-12-23",
//"soldier_type": "육군",
//"soldier_name": "이준호",
//"degree": "일병",
//"soldier_profile": "https://thecamp.s3.ap-northeast-2.amazonaws.com/lifecycle.png",
//"end_date": "2021-07-03",
//"imgList": [
//"https://thecamp.s3.ap-northeast-2.amazonaws.com/lifecycle.png"
//]
//},

import Foundation

struct SoldierModel: Codable {
    
    struct Data: Codable {
        let soldieridx: Int
        let joindate: String
        let soldiertype: String
        let soldiername: String
        let degree: String
        let soldierprofile: String
        let enddate: String
        let imgList: [String]
        enum CodingKeys: String, CodingKey {
            case soldieridx = "soldier_idx"
            case joindate = "join_date"
            case soldiertype = "soldier_type"
            case soldiername = "soldier_name"
            case degree = "degree"
            case soldierprofile = "soldier_profile"
            case enddate = "end_date"
            case imgList = "imgList"
        }
    }
    var status: Int
    var success: Bool
    var message: String
    var data: [Data]
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
        
    }
}
