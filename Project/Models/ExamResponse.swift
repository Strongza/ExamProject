// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let examResponse = try? newJSONDecoder().decode(ExamResponse.self, from: jsonData)

import Foundation

// MARK: - ExamResponse
struct ExamResponse: Codable {
    let status: Status
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let examID, examName, examDescription: String
    let questions: [QuestionElement]
    
    enum CodingKeys: String, CodingKey {
        case examID = "exam_id"
        case examName = "exam_name"
        case examDescription = "exam_description"
        case questions
    }
}

// MARK: - QuestionElement
struct QuestionElement: Codable {
    let question: QuestionQuestion
    let choices: [Choice]
}

// MARK: - Choice
struct Choice: Codable {
    let choiceText: String?
    let choicePic: String?
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case choiceText = "choice_text"
        case choicePic = "choice_pic"
        case score
    }
}

// MARK: - QuestionQuestion
struct QuestionQuestion: Codable {
    let questionText: String
    let questionPic: String?
    let questionType: String
    
    enum CodingKeys: String, CodingKey {
        case questionText = "question_text"
        case questionPic = "question_pic"
        case questionType = "question_type"
    }
}

// MARK: - Status
struct ExamStatus: Codable {
    let code, message: String
}
