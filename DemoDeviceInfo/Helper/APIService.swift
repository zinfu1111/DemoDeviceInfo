//
//  APIService.swift
//  DemoDeviceInfo
//
//  Created by 連振甫 on 2021/9/24.
//

import Foundation

struct XHR {
    
    enum HttpMethod:String {
        case GET = "GET"
        case POST = "POST"
    }
    
    enum ContentType:String {
        case XHR = "application/x-www-form-urlencoded"
    }

    func urlSession(method: HttpMethod,contentType:ContentType, file: String, data: Data? = nil, completionHandler: @escaping (String?) -> Void) {

        let file = file.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        // Set up the URL request
        guard let url = URL.init(string: file) else {
            print("Error: cannot create URL")
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue;
        urlRequest.addValue(contentType.rawValue, forHTTPHeaderField:"Content-Type")
        urlRequest.httpBody = data

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // vs let session = URLSession.shared

        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in

            DispatchQueue.main.async { // Correct

                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }

                completionHandler(String(data: responseData, encoding: .utf8))
            }
        })
        task.resume()
    }

}
