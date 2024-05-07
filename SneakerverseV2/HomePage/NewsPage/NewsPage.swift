import SwiftUI

struct NewsPage<ViewModel>: View where ViewModel: NewsPageViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Text("NewsPage")
    }
}
