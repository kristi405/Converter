import Foundation

struct Rate: Codable {
    let curID: Int
    let date: String
    let curAbbreviation: String
    let curScale: Int
    let curName: String
    let curOfficialRate: Double

    enum CodingKeys: String, CodingKey {
        case curID = "Cur_ID"
        case date = "Date"
        case curAbbreviation = "Cur_Abbreviation"
        case curScale = "Cur_Scale"
        case curName = "Cur_Name"
        case curOfficialRate = "Cur_OfficialRate"
    }
    
    init(curID: Int, date: String, curAbbreviation: String, curScale: Int, curName: String, curOfficialRate: Double) {
        self.curID = curID
        self.date = date
        self.curAbbreviation = curAbbreviation
        self.curScale = curScale
        self.curName = curName
        self.curOfficialRate = curOfficialRate
    }
}


