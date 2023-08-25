//
//  AuthEnd.swift
//  HomeTask
//
//  Created by Сергей Зайцев on 22.08.2023.
//

import SwiftUI
import SDWebImage
import SwiftyJSON
import Alamofire

struct AuthEnd: View {
    
    @ObservedObject var obc = MyObserver()
    
    var body: some View {
        List(obc.datas){i in
            CardElement(name: i.name, url: i.url)
        }
    }
}

struct AuthEnd_Previews: PreviewProvider {
    static var previews: some View {
        AuthEnd()
    }
}

class MyObserver : ObservableObject {
    
    @Published var datas = [dataType]()
    
    init() {
        
        AF
            .request("https://api.github.com/users/hadley/orgs")
            .validate(statusCode: 200...300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                
                switch response.response?.statusCode {
                case 403?:
                    print("stop 403!")
                    self.stopAllSessions()

                case 404?:
                    print("WTF 404")
                   // self.stopAllSessions()

                default: return
                }
            }
            .responseData { (data) in
                let json = try! JSON(data: data.data!)
                
                for i in json{
                    
                    self.datas.append(dataType(id: i.1["id"].intValue, name: i.1["login"].stringValue, url:  i.1["avatar_url"].stringValue))
                    
                }
            }
        
            AF
                .request("https://api.github.com/users/hadley/orgs")
                .validate(statusCode: 200...300)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        print("Validation Successful")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                    switch response.response?.statusCode {
                    case 403?:
                        print("stop 403 12345")
                       // self.stopAllSessions()
                    case 404?:
                        print("WTF")
                      //  self.stopAllSessions()

                        
                    default: return
                    }
                }
                .responseData { (data) in
                    let json = try! JSON(data: data.data!)
                    
                    for i in json{
                        
                        self.datas.append(dataType(id: i.1["id"].intValue, name: i.1["login"].stringValue, url:  i.1["avatar_url"].stringValue))
                        
                    }
                }
    }
    
    func stopAllSessions() {
        AF.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
    }
}

struct dataType: Identifiable {
    
    var id: Int
    var name: String
    var url: String
    
}




