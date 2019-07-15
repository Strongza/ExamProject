// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let examlistResponse = try? newJSONDecoder().decode(ExamlistResponse.self, from: jsonData)

import Foundation

// MARK: - ExamlistResponse
struct ExamlistResponse: Codable {
    let status: Status
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let examID: Int
    let examName: String
    let examTotalScore, countQuestion: Int
    
    enum CodingKeys: String, CodingKey {
        case examID = "exam_id"
        case examName = "exam_name"
        case examTotalScore = "exam_total_score"
        case countQuestion = "count_question"
    }
}

// MARK: - Status
struct Status: Codable {
    let code: Int
    let message: String
}
