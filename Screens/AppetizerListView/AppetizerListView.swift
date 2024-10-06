
import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers) {appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Appetizers")
                .listStyle(.plain)
                .disabled( viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius:  viewModel.isShowingDetail ? 20 : 0)
             
            if  viewModel.isShowingDetail {
                AppetizerDetailView(appetizer:  viewModel.selectedAppetizer!, isShowingDetal:  $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
    
    
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View{
        AppetizerListView()
    }
}
