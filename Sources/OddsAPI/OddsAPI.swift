public protocol Api {
    func fetchSports() async -> Result<[Sport], ApiError>
    func fetchUpcomingOdds() async -> Result<Odds, ApiError>
}

@available(macOS 12.0, *)
open class OddsApi: BaseApi, Api {
    
    var apiKey: String
    
    public init(withKey apiKey: String) {
        self.apiKey = apiKey
    }
        
    public func fetchSports() async -> Result<[Sport], ApiError> {
        await sendRequest(url: allSportsURL(withKey: self.apiKey), responseModel: [Sport].self)
            .map { $0 }
    }
    
    public func fetchUpcomingOdds() async -> Result<Odds, ApiError> {
        await sendRequest(url: upcomingOddsURL(withKey: self.apiKey), responseModel: [Odd].self)
            .map { $0 }
    }
}
