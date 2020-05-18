//
//  ContentView.swift
//  SteamUi
//
//  Created by Al Amin on 18/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var whiteFont = Color.white
    @State private var tabSelect = 0
    
    var body: some View {
        ZStack{
            Color("Color")//.opacity(0.1)
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                TopMneu()
                if tabSelect == 0 {
                    ScrollView(.vertical, showsIndicators: false) {
                        TopView()
                        MiddleView()
                        BottomView()
                    }
                }else{
                  //  Detail()
                }
                
                
                HStack{

                    Button(action: {
                        self.tabSelect = 0
                    }) {
                        Image("home")
                            .foregroundColor(self.tabSelect == 0 ? .white : .gray)
                    }
                    Spacer()

                    Button(action: {
                        self.tabSelect = 1
                    }) {
                        Image("search")
                            .foregroundColor(self.tabSelect == 1 ? .white : .gray)
                    }
                    Spacer()

                    Button(action: {
                        self.tabSelect = 2
                    }) {
                        Image("person")
                            .foregroundColor(self.tabSelect == 2 ? .white : .gray)
                    }
                    Spacer()

                    Button(action: {
                        self.tabSelect = 3
                    }) {
                        Image("menu")
                            .foregroundColor(self.tabSelect == 3 ? .white : .gray)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .padding(.top)
            }
       .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// sample data.....

var top = ["Card1","Card2"]
var middle = ["m1","m2","m3"]
var bottom = ["b1","b2","b3"]
var detail = ["d1","d2"]

struct TopView: View {
    @State private var show = false
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Featured")
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 15){
                    ForEach(top, id: \.self){ top in
                        Image(top)
                            .onTapGesture {
                                self.show.toggle()
                        }
                    }
                }
                
            }
            
        }
        .padding(.top)
        .sheet(isPresented: $show) {
            Detail()
        }
    }
}

struct MiddleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("New On Steam")
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 15){
                    ForEach(middle, id: \.self){ middle in
                        Image(middle)
                    }
                }
                
            }
            
        }
        .padding(.top)
    }
}

struct BottomView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Recommended")
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 15){
                    ForEach(bottom, id: \.self){bottom in
                        Image(bottom)
                    }
                }
                
            }
            
        }
        .padding(.top)
    }
}

struct TopMneu: View {
    var body: some View {
        ZStack{
            HStack{
                Text("$89")
                    .foregroundColor(.gray)
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "cart")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                }
                
            }
            Image("Logo")
                .renderingMode(.original)
        }
    }
}


struct CustomCurve: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
    
    
}

struct Detail: View {
    @State private var detailSelect = 0
    var body: some View {
        VStack(spacing: 0){
            Image("Header")
                
            ZStack{
                
                VStack(spacing: 30){
                    HStack(spacing: 20){
                        Button(action: {
                            self.detailSelect = 0
                        }) {
                            Text("About")
                                .foregroundColor(self.detailSelect == 0 ? .white : .gray)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(self.detailSelect == 0 ? Color.gray.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            self.detailSelect = 1
                        }) {
                            Text("Media")
                                .foregroundColor(self.detailSelect == 1 ? .white : .gray)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(self.detailSelect == 1 ? Color.gray.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 40)
                    // .padding(.bottom)
                    if self.detailSelect == 0{
                        Text("Welcome to San Francisco, the birthplace of the technological revolution. Play as young Marcus, a brilliant hacker, and join DedSec, the most celebrated hacker group. Your goal: the largest hacking operation in history.").padding(.vertical, 15)

                        HStack{
                            Spacer()

                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("More About This Game >")
                            }
                        }

                        HStack{

                            Text("System Requiremnts")

                            Spacer()
                        }

                        HStack(spacing: 8){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image("min")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                //.rotationEffect(30)
                                Text("Minimum Requirements")
                            }

                            Spacer()
                        }

                        HStack(spacing: 8){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image("max")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                //.rotationEffect(30)
                                Text("Minimum Requirements")
                            }

                            Spacer()
                        }

                    }else{
                        VStack(alignment: .leading, spacing: 25) {
                            Text("Images")
                                .foregroundColor(.white)
                            //.font(.system(size: 20))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack (spacing: 15){
                                    ForEach(detail, id: \.self){ detail in
                                        Image(detail)
                                    }
                                }

                            }

                        }
                        .padding(.top)

                        VStack(alignment: .leading, spacing: 25) {
                            Text("Video")
                                .foregroundColor(.white)
                            //.font(.system(size: 20))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack (spacing: 15){
                                    ForEach(detail, id: \.self){ detail in
                                        Image(detail)
                                    }
                                }

                            }

                        }
                        .padding(.top)
                    }

                }
                .padding()

                .foregroundColor(.white).opacity(0.5)
                .cornerRadius(50)
               // Color.clear
            }
            .background(CustomCurve().fill(Color.black))
            .edgesIgnoringSafeArea(.bottom)
            .offset(y: -20)
            .padding(.bottom, -20)
//            .zIndex(1)
            
            Spacer()
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}
