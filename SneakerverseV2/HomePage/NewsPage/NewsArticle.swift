struct NewsPageResponse: Codable {
    let blogPosts: [BlogPost]
}

struct BlogPost: Identifiable, Codable {
    let id: Int
    let title : String
    let category : [String]
    let description : String
    let coverImageUrl : String
    let imageUrl : [String]
    let link : String
    let videoUrl: String?
}
