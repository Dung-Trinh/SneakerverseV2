import SwiftUI

struct NewsPage<ViewModel>: View where ViewModel: NewsPageViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("NEWS")
                .fontWeight(.bold)
                .font(.title)
            ScrollView {
                VStack {
                    ForEach(viewModel.blogPosts) { blogPost in
                        BlogPostTile(post: blogPost)
                    }
                }
            }
        }
        .padding()
        .task {
            await viewModel.loadContent()
        }
    }
}

#Preview {
    NewsPage(
        viewModel: NewsPageViewModelImpl()
    )
}
