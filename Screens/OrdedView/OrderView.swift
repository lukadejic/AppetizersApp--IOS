//
//  OrderView.swift
//  Appetizers
//
//  Created by MacBook on 1/31/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform:  order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button{
                        print("order placed")
                    }label:{
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
                
            }
            .navigationTitle("Orders")
        }
    }

}


#Preview {
    OrderView()
        .environmentObject(Order())
}
