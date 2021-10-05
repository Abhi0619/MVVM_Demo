//
//  UserModel.swift
//  MVVM_Demo_Api
//
//  Created by IPS MAC OS 2 on 23/09/21.
//

import UIKit

class UserModel:Codable{
    var id = ""
    var title:String = ""
    var userId:String = ""
    var completed:Bool = false
    var userdetail:Darshan?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case userId = "userId"
        case completed
        case userdetail = "user_detail"
    }
    init(userData:[String:Any]){
        
        if let value = userData[CodingKeys.id.rawValue],!(value is NSNull){
            self.id = "\(value)"
        }
        if let value = userData[CodingKeys.userId.rawValue],!(value is NSNull){
            self.userId = "\(value)"
        }
        if let value = userData[CodingKeys.title.rawValue],!(value is NSNull){
            self.title = "\(value)"
        }
        if let value = userData[CodingKeys.completed.rawValue],!(value is NSNull), let updatedvalue = value as? Bool{
            self.completed = updatedvalue
        }
        if let userDetail = userData[CodingKeys.userdetail.rawValue] as? [String:Any]{
            self.userdetail = Darshan.init(userDetail: userDetail)
        }
    }
}
class Darshan:Codable{
    var name = ""
    var age = ""
    var mobileNumber = ""
    var birthDate = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case mobileNumber = "mobile_number"
        case birthDate = "birth_date"
    }
    init(userDetail:[String:Any]){
        if let value = userDetail[CodingKeys.name.rawValue],!(value is NSNull){
            self.name = "\(value)"
        }
        if let value = userDetail[CodingKeys.age.rawValue],!(value is NSNull){
            self.age = "\(value)"
        }
        if let value = userDetail[CodingKeys.mobileNumber.rawValue],!(value is NSNull){
            self.mobileNumber = "\(value)"
        }
        if let value = userDetail[CodingKeys.birthDate.rawValue],!(value is NSNull){
            self.birthDate = "\(value)"
        }
    }
}
