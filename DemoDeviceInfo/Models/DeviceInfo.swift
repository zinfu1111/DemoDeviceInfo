//
//  DeviceInfo.swift
//  DemoDeviceInfo
//
//  Created by 連振甫 on 2021/9/24.
//

import Foundation

struct DeviceInfo:Codable {
    let phonetype:String
    let userdeviceid:String
    let deviceos:String
    let devicemodel:String
    let devicecompany:String
    let appip:String
    let username:String
    
    static func encode(_ m:DeviceInfo) -> Data {
        return "phonetype=\(m.phonetype)&userdeviceid=\(m.userdeviceid)&deviceos=\(m.deviceos)&devicemodel=\(m.devicemodel)&devicecompany=\(m.devicecompany)&appip=\(m.appip)&username=\(m.username)".data(using: .utf8)!
    }
}
