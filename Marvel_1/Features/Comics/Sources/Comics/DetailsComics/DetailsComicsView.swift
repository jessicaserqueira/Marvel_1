//
//  File 3.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import SwiftUI

public struct DetailsComicsView: View {
    
    public init() {}
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    public var borderColor: Color = .black
    let navigationController = UINavigationController()
    
    private func createBorder(borderColor: Color) -> some View {
        return RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 16)
                ZStack(alignment: .top, content: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 358, height: 250)
                        .scaleEffect()
                        .foregroundColor(Color.white)
                        .overlay(createBorder(borderColor: Color.black))
                        .foregroundColor(Color.white)
                    
                    
                    VStack {
                        
                        Rectangle()
                            .frame(width: 344, height: 170)
                            .aspectRatio(contentMode: .fill)
                            .overlay(createBorder(borderColor: Color.black))
                            .foregroundColor(Color.white)
                            .padding(8)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 344, height: 52)
                                .overlay(createBorder(borderColor: Color.black))
                                .foregroundColor(Color.white)
                            
                            Text("Miranha da Marvel")
                                .font(Font.custom("Bangers-Regular", size: 32))
                                .frame(width: 344, height: 52, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 8)
                        }.padding(-8)
                    }
                })
                Spacer(minLength: 16)
                
                ZStack(alignment: .top, content: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 358, height: 453)
                        .scaleEffect()
                        .overlay(
                            ScrollView {
                                VStack {
                                    Text("I kinda knew prices would go up over time so that wasn't surprising. In 2013 my data shows an average of $4.12 compared to ten cents in 1950. Page count is a bit lower, but not dramatically. What was really epic was the covers. I mean, I knew styles have changed over time, but to see it all at once was awesome! For example, here are the ones I got for 2013. I kinda knew prices would go up over time so that wasn't surprising. In 2013 my data shows an average of $4.12 compared to ten cents in 1950. Page count is a bit lower, but not dramatically. What was really epic was the covers. I mean, I knew styles have changed over time, but to see it all at once was awesome! For example, here are the ones I got for 2013. There isn't a lot to this. I basically loop over a set of years and fire off async requests to get the data. For each year I figure out my averages, collect images, and pick out 5 random ones. Finally the results are printed to screen. This app is slow as I wait for all 63 requests to finish before I render. A better demo would render as the results came in and properly handle displaying them in the right order. The result was... fascinating.\n")
                                        .font(Font.custom("Nunito-Regular", size: 16))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(16)
                                }
                            }.frame(width: 358, height: 430)
                        )
                        .overlay(createBorder(borderColor: Color.black))
                })
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(L10n.detailsCharacter))
            .font(Font.custom("Nunito-Medium", size: 16))
            .navigationBarItems(leading:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("back")
            })
    }
}
