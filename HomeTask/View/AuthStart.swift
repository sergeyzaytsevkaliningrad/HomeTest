//
//  AuthStart.swift
//  HomeTask
//
//  Created by Сергей Зайцев on 22.08.2023.
//

import SwiftUI

struct AuthStart: View {
    
    var startName = "Войти"
    
    @State var nameNil = ""
    @State var nameAuth = "Введите имя"
    @State var numAuth = "Введите номер"
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.green, .cyan, .cyan ,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        NavigationStep(type: .fullScreenSheet, style: .view, destination: {
                            AuthEnd()
                        }){
                            Text("Пропустить")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text(startName)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        
                    }
                    
                    //Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 35)
                            .foregroundColor(Color.white.opacity(0.4))
                            .frame(width: 350, height: 230)
                            .shadow(radius: 15)
                        
                        VStack{
                            VStack(spacing: 30){
                                
                                VStack{
                                    Text("Имя")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    //.frame(width: 346, height: 50)
                                        .padding(.leading, -160)
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 35)
                                            .foregroundColor(Color.white.opacity(0.4))
                                            .frame(width: 326, height: 50)
                                            .shadow(radius: 15)
                                        
                                        VStack{
                                            TextField(nameAuth, text: $nameNil)
                                                .frame(width: 266, height: 50)
                                                 .cornerRadius(10)
                                        }
                                    }
                                }
                                
                                VStack{
                                    Text("Номер")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    //.frame(width: 346, height: 50)
                                        .padding(.leading, -160)
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 35)
                                            .foregroundColor(Color.white.opacity(0.4))
                                            .frame(width: 326, height: 50)
                                            .shadow(radius: 15)
                                        VStack{
                                            TextField(numAuth, text: $nameNil)
                                                .frame(width: 266, height: 50)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Это лучшие мини приложение которое можно было встреть в этом мире")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 346, height: 50)
                        
                        Text("Хотелось бы рассказать про 3 способа работы с Аlomofire ")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 346, height: 50)
                    }
                    
                    Spacer()
                }
                
                VStack{
                    
                    NavigationStep(type: .fullScreenSheet, style: .view, destination: {
                        AuthEnd()
                    }) {
                        Text("Узнай больше!")
                            .foregroundColor(.blue)
                            .frame(width: 346, height: 60)
                            .background(.white.opacity(0.8))
                            .cornerRadius(100)
                    }
                }
            }
        }
    }
}

struct AuthStart_Previews: PreviewProvider {
    static var previews: some View {
        AuthStart()
    }
}

