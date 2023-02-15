//
//  File.swift
//
//
//  Created by NMAS Amaral on 30/12/22.
//
import SwiftUI

public struct ScreenDetailsView: View {
    
    public init() {}
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    public var viewModel = ScreenDetailsModel()
    public var borderColor: Color = .black
    
    private func createBorder(borderColor: Color) -> some View {
        return RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
    
                }) {
                    Image("back")
                        .position(x:24, y: 27)
                }
                
                
                Spacer(minLength: 40)
                
                ZStack(alignment: .top, content: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 358, height: 250)
                        .scaleEffect()
                        .overlay(createBorder(borderColor: Color.black))
                    
                    VStack {
                        Spacer(minLength: 10)
                        Image("imageTest")
                            .aspectRatio(contentMode: .fill)
                            .overlay(createBorder(borderColor: Color.black))
                        
                        Text("Miranha da Marvel")
                            .font(Font.custom("Bangers-Regular", size: 32))
                            .padding()
                            .frame(width: 344, height: 52)
                            .multilineTextAlignment(.leading)
                            .overlay(createBorder(borderColor: Color.black))
                        Spacer(minLength: 10)
                    }
                })
            }
            
            Text("\nI kinda knew prices would go up over time so that wasn't surprising. In 2013 my data shows an average of $4.12 compared to ten cents in 1950. Page count is a bit lower, but not dramatically. What was really epic was the covers. I mean, I knew styles have changed over time, but to see it all at once was awesome! For example, here are the ones I got for 2013. I kinda knew prices would go up over time so that wasn't surprising. In 2013 my data shows an average of $4.12 compared to ten cents in 1950. Page count is a bit lower, but not dramatically. What was really epic was the covers. I mean, I knew styles have changed over time, but to see it all at once was awesome! For example, here are the ones I got for 2013. There isn't a lot to this. I basically loop over a set of years and fire off async requests to get the data. For each year I figure out my averages, collect images, and pick out 5 random ones. Finally the results are printed to screen. This app is slow as I wait for all 63 requests to finish before I render. A better demo would render as the results came in and properly handle displaying them in the right order. The result was... fascinating.\n")
                .font(Font.custom("Nunito-Regular", size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .overlay(createBorder(borderColor: Color.black))
                .padding()
        }).navigationBarBackButtonHidden(true)
    }
}
