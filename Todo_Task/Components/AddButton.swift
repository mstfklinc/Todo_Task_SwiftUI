//
//  AddButton.swift
//  Todo_Task
//
//  Created by Mustafa Kılınç on 15.04.2023.
//

import SwiftUI

struct AddButton: View {
    
    @State private var showingToDoView : Bool = false
    @State private var isDetectingLongGesture : Bool = false
    @State private var showingbuttons : Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                ZStack(alignment: .bottomTrailing){
                        Button(action: {self.showingbuttons.toggle()}){
                            Image(systemName: "bag.badge.plus")
                                .padding(.all, 24)
                                .rotationEffect(.degrees(showingbuttons ? 0 : -90), anchor: .center)
                        }.background(Circle().fill(Color.blue).shadow(radius: 8, x:4, y:4))
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .offset(x:-50, y: showingbuttons ? -150 : 0)
                            .opacity(showingbuttons ? 1 : 0)

                        Button(action: {self.showingbuttons.toggle()}){
                            Image(systemName: "bag.badge.plus")
                                .padding(.all, 24)
                                .rotationEffect(.degrees(showingbuttons ? 0 : 90), anchor: .center)
                        }.background(Circle().fill(Color.blue).shadow(radius: 8, x:4, y:4))
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .offset(x: showingbuttons ? -140 : 0, y: showingbuttons ? -60 : 0)
                            .opacity(showingbuttons ? 1 : 0)

                        Button(action:{ self.showingbuttons.toggle()}){
                            ZStack{
                                Circle()
                                    .foregroundColor(.blue).opacity(0.1)
                                    .frame(width: 100, height: 100)
                                Circle()
                                    .foregroundColor(.blue).opacity(0.2)
                                    .frame(width: 70, height: 70)
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 40))
                                    .padding(.all, 24)
                                    .rotationEffect(.degrees(showingbuttons ? 45 : 0), anchor: .center)
                            }

                        }

                }.animation(.spring())
            }
        
        }.padding(.bottom, 80)
            .padding(.trailing, 20)

    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
