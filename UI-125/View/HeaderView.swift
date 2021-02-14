//
//  HeaderView.swift
//  UI-125
//
//  Created by にゃんにゃん丸 on 2021/02/13.
//

import SwiftUI

struct HeaderView: View {
    init() {
        UIScrollView.appearance().bounces = false
       
    }
    @EnvironmentObject var model : Main
    
    var body: some View {
        
        
        ZStack(alignment: .top, content: {
            Header()
                .zIndex(1)
                .offset(y: model.headeroffset)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing:15){
                    
                    ForEach(1...5,id:\.self){index in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width - 30, height: 250)
                            .cornerRadius(1)
                        
                        HStack(spacing:15){
                            
                            Image("pro")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 15, content: {
                                Text("New Cat Food Comming Soon")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .multilineTextAlignment(.leading)
                                
                                Text("I'm Cat . 3 hours ago")
                                    .font(.callout)
                                    .fontWeight(.ultraLight)
                                    .foregroundColor(.primary)
                                    
                            })
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.vertical,6)
                        
                        
                        
                        
                    }
                    
                }
                .padding(.top,75)
                .overlay(
                    
                    GeometryReader{ proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                        DispatchQueue.main.async {
                            if model.startMinY == 0{
                                
                                model.startMinY = minY
                                
                            }
                            
                            let offset = model.startMinY - minY
                            
                            
                            if offset > model.offset{
                                model.bottomscrolloffset = 0
                                if model.topscrolloffset == 0{
                                    
                                    model.topscrolloffset = offset
                                    
                                }
                                let progress = (model.topscrolloffset + getmaxoffset()) - offset
                                
                                let offsetcondition = (model.topscrolloffset + getmaxoffset()) >= getmaxoffset() && getmaxoffset() - progress <= getmaxoffset()
                                
                                let headeroffset = offsetcondition ? -(getmaxoffset() - progress) : -getmaxoffset()
                                
                                model.headeroffset = headeroffset
                                
                                
                            }
                            
                            if offset < model.offset{
                                
                                model.topscrolloffset = 0
                                if model.bottomscrolloffset == 0{
                                    
                                    model.bottomscrolloffset = offset
                                    
                                    
                                    
                                    
                                }
                                
                                withAnimation(.easeOut){
                                    
                                    
                                    let headeroffset = model.headeroffset
                                    
                                    model.headeroffset = model.bottomscrolloffset > offset + 40 ? 0 :(headeroffset != -getmaxoffset() ? 0 : headeroffset)
                                }
                                
                                
                            }
                            model.offset = offset
                            
                            
                        }
                    
                    
                    
                    return Color.clear
                    
                    
                }
                    .frame(height: 0)
                    ,alignment: .top
               
                )
                
                
              
            
                
                
            })
            
        })
        .navigationBarHidden(true)
        
    }
    func getmaxoffset()->CGFloat{
        
        return model.startMinY + (edges?.top ?? 0) + 10
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

struct Header : View {
    @Environment(\.colorScheme) var scheme
    @Environment(\.presentationMode) var present
    var body: some View{
        
        HStack(spacing:20){
            
            Image("yo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            Text("You Tube")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .kerning(0.5)
                .offset(x: -10)
            
            Spacer(minLength: 0)
                
            
            Button(action: {}, label: {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.gray)
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.gray)
            })
            
            Button(action: {
                
                present.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "gear")
                    .font(.title2)
                    .foregroundColor(.gray)
                   
            })
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                
            
            
                
            
            
            
            
        }
        .padding(.horizontal)
        .padding(.vertical,8)
        .background((scheme == .dark ? Color.black : Color.white).ignoresSafeArea(.all, edges: .top))
        .overlay(
        Divider()
            .background(Color.purple)
            ,alignment: .bottom
        )
    }
}
