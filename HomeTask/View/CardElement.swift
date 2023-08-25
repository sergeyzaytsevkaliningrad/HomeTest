//
//  CardElement.swift
//  HomeTask
//
//  Created by Сергей Зайцев on 24.08.2023.
//

import SwiftUI
import SDWebImage
import SwiftyJSON
import Alamofire

struct CardElement: View {
    
    var name = ""
    var url = ""
    
    var body: some View {
        
        HStack{
            
            AsyncImage(url: URL(string: url))
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
           
        }
    }
}

struct CardElement_Previews: PreviewProvider {
    static var previews: some View {
        CardElement()
    }
}
