//
//  CircleView.swift
//  UI-125
//
//  Created by にゃんにゃん丸 on 2021/02/13.
//

import SwiftUI

struct CircleView: View {
    @State var anlge :Double = 0
    @State var on = false
    @State var from : Date = Date()
    @State var to : Date = Date()
    @State var small = rect.height < 750
    @State var next = false
   
    var body: some View {
        VStack{
            
            ScrollView(small ? .vertical : .init(), showsIndicators: false, content: {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    
                    Image("top")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: small ? 150 : nil, height: small ? 150 : 350)
                        
                    
                    
                    HStack{
                        
                        
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                
                                .foregroundColor(.black)
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "gear")
                                .font(.title2)
                                
                                .foregroundColor(.black)
                            
                            
                        }
                        
                        
                    }
                    .padding()
                    .padding(.top,edges?.top ?? 0)
                    
                    
                    
                    
                    
                }
                .padding(.bottom)
                
                Text("STABUCKS")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                    ZStack{
                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: rect.width / 2, height: rect.width / 2)
                        
                        
                        
                        
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: rect.width / 2 - 45, height: rect.width / 2 - 45)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                                .rotationEffect(.init(degrees: anlge))
                            
                            
                            Circle()
                                .fill(Color.red)
                                .frame(width: 20, height: 20)
                                .offset(x: (rect.width / 2 - 100) / 2)
                                .rotationEffect(.init(degrees: anlge))
                                .gesture(DragGesture(minimumDistance:0).onChanged(onchanged(value:)))
                                .rotationEffect(.init(degrees: -210))
                            dots()
                            
                        }
                     
                    }
                    
                    HStack{
                        
                        
                        Text("16°C")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("25°C")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        
                        
                        
                    }
                    .padding(.bottom,30)
                    
                    
                })
                .padding()
                .padding(.top)
                
                HStack{
                    Spacer()
                    HStack(spacing:15){
                        
                        
                        
                        Text("Power Save")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        
                        Toggle("", isOn: $on)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color.purple.opacity(0.3)))
                          
                    }
                    
                    .padding(.vertical)
                    .padding(.horizontal,20)
                    .background(BlurView().cornerRadius(5))
                    
                    
                }
                .padding()
                
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text("From")
                        .font(.caption)
                    
                    HStack(spacing:0){
                        
                        DatePicker("", selection: $from, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.green)
                        
                        Text("To")
                            .font(.caption)
                        
                        DatePicker("", selection: $to, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.green)
                        
                    }
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom,30)
                
                
                
            })
            
            ZStack{
                
                HStack{
                    
                    
                   
                        Button(action: {}) {
                            
                            NavigationLink(destination: HeaderView()) {
                                
                                Image(systemName: "house")
                                    .font(.title)
                                    .font(.system(size: 25))
                                    .padding()
                                    .foregroundColor(.green)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.black.opacity(0.1), radius: -5, x: -5, y: -5)
                                
                            }
                            
                           
                                
                            
                            
                            
                        }
                    
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "pencil")
                            .font(.title)
                            .font(.system(size: 25))
                            .padding()
                            .foregroundColor(.green)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: -5, x: -5, y: -5)
                            .offset(y: -5)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    
                    Button(action: {}) {
                        Image(systemName: "envelope.circle.fill")
                            .font(.title)
                            .font(.system(size: 25))
                            .padding()
                            .foregroundColor(.green)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: -5, x: -5, y: -5)
                        
                        
                        
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top,small ? 0 : 25)
            .padding(.bottom,edges?.bottom == 0 ? 15 : 0)
            
            
          
            
        }
        .ignoresSafeArea(.all, edges: .top)
        
        .background(
            
            ZStack{
                Color.yellow.opacity(0.3)
               
                Color.red.opacity(0.3).clipShape(CustomShape())
                    .rotationEffect(.init(degrees: 180))
                
                
                
            }
            .ignoresSafeArea(.all, edges: .all)
        
        )
        .navigationBarHidden(true)
        
       
        
    }
    func onchanged(value:DragGesture.Value){
        
        let translation = value.location
        let vector = CGVector(dx: translation.x, dy: translation.y)
        let radius = atan2(vector.dy - 10, vector.dx - 10)
        
        var angle = radius * 180 / .pi
        if angle < 0 {angle = 360 + angle}
        if angle <= 240{
            self.anlge = Double(angle)
        }
        
        
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = rect.width / 2
            let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
            
            path.move(to: CGPoint(x: center - 150, y: 0))
            
            let to1 = CGPoint(x: center, y: bottom + 70)
            let contro1 = CGPoint(x: center - 70, y: 0)
            let contro2 = CGPoint(x: center - 70, y: bottom + 70)
            
            let to2 = CGPoint(x: center + 150, y: 0)
            
            let contro3 = CGPoint(x: center + 70, y: bottom + 70)
            let contro4 = CGPoint(x: center + 70, y: 0)
            
            path.addCurve(to: to1, control1: contro1, control2: contro2)
            path.addCurve(to: to2, control1: contro3, control2: contro4)
            
            
            
            
        }
    }
}
