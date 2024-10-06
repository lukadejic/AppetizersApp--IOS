//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by MacBook on 2/20/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    
    @Binding var isShowingDetal: Bool
    
    var body: some View {
       
        VStack{
            
            VStack{
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                
                VStack{
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                }
                
                HStack(spacing: 40){
                    
                    NutritionInfo(text: "Calories", value: appetizer.calories)
                    NutritionInfo(text: "Carbs", value: appetizer.carbs)
                    NutritionInfo(text: "Protein", value: appetizer.protein)
                }
                
                Spacer()
                
                Button{
                    order.add(appetizer)
                    isShowingDetal = false
                }label: {
                    Text("%\(appetizer.price,specifier: "%.2f") - Add To Order")
                }
                .modifier(StandardButtonStyle())
                .padding(.bottom,30)
                
            }
            
        
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetal = false
        }label: {
            XDissmissButton()
        },alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: mockData.sampleAppetizer, isShowingDetal: .constant(true))
}

struct NutritionInfo: View {
    let text:String
    let value: Int
    
    var body: some View {
        VStack(spacing: 6){
              Text(text)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
