import Foundation

struct Rate: Codable {
    let curID: Int
    let date: DateEnum
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
    
    init(curID: Int, date: DateEnum, curAbbreviation: String, curScale: Int, curName: String, curOfficialRate: Double) {
        self.curID = curID
        self.date = date
        self.curAbbreviation = curAbbreviation
        self.curScale = curScale
        self.curName = curName
        self.curOfficialRate = curOfficialRate
    }
}

enum DateEnum: String, Codable {
    case the20210903T000000 = "2021-09-03T00:00:00"
}


