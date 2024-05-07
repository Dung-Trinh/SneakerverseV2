import SwiftUI

struct HomePage<ViewModel>: View where ViewModel: HomePageViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            NewsPage(viewModel: NewsPageViewModelImpl())
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
            CalendarPage(viewModel: CalendarPageViewModelImpl())
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            AccountPage(viewModel: AccountPageViewModelImpl())
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}
