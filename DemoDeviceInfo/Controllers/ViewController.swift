//
//  ViewController.swift
//  DemoDeviceInfo
//
//  Created by 連振甫 on 2021/9/24.
//

import UIKit
import System
import DeviceKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let deviceInfo = DeviceInfo(phonetype: Device.identifier, userdeviceid: UIDevice.current.uuid, deviceos: Device.current.systemVersion!, devicemodel: Device.current.description, devicecompany: "Apple Inc.", appip: UIDevice.current.ipv4, username: "連振甫")
        
        print(deviceInfo)
        let postData = DeviceInfo.encode(deviceInfo)
        XHR().urlSession(method: .POST,contentType: .XHR, file: "https://cloud.mds.com.tw/WistronMobile/SysFun/WebService/LoginChk_Test.aspx", data: postData) { response in
            
            DispatchQueue.main.async {
                let resultLabel = UILabel()
                resultLabel.frame.size = CGSize(width: 200, height: 200)
                resultLabel.center = self.view.center
                resultLabel.textAlignment = .center
                resultLabel.text = response!
                self.view.addSubview(resultLabel)
            }
        }
        
    }
    

}
