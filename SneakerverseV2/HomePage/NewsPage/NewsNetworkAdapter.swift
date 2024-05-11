import Alamofire

protocol NewsNetworkAdapter {
    func fetchBlogPosts() async throws -> [BlogPost]
}

class NewsNetworkAdapterImpl: NewsNetworkAdapter {
    func fetchBlogPosts() async throws -> [BlogPost] {
        let urlString = "http://localhost:3000/blogPosts"
        return try await AF.request(urlString)
            .serializingDecodable(NewsPageResponse.self)
            .value
            .blogPosts
    }
}
