//
//  ContentView.swift
//  Appetizers
//
//  Created by MacBook on 1/31/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orders: Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
                .badge(orders.items.count)
        }
    }
}

struct AppetizerTabView_Previews: PreviewProvider{
    static var previews: some View{
        AppetizerTabView()
            .environmentObject(Order())
    }
}
