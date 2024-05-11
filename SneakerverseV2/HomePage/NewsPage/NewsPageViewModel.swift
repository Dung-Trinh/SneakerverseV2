import Foundation
protocol NewsPageViewModel: ObservableObject {
    var blogPosts: [BlogPost] { get }
    
    func loadContent() async
}

class NewsPageViewModelImpl: NewsPageViewModel {
    @Published var blogPosts: [BlogPost] = []
    private let adapter: NewsNetworkAdapter = NewsNetworkAdapterImpl()
    
    func loadContent() async {
        do {
            blogPosts = try await adapter.fetchBlogPosts()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
