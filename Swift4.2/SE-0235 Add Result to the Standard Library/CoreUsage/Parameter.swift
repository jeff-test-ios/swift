public enum Form {
    case normal, noData, badUrl
}

public func link(_ form: Form) -> String {
    switch form {
    case .normal:
        return "https://opendata.cwb.gov.tw/api/v1/rest/datastore/E-A0015-001?Authorization=rdec-key-123-45678-011121314"
    case .noData:
        return "http://123.com"
    case .badUrl:
        return "948794狂"
    }
}
