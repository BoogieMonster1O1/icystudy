import Foundation

struct Question: Codable {
    let question: String
    let options: [String]
    let count: Int
    let correct: Int
}

var questions: [Question] = []

extension Array where Element == String {
    func trimConc() -> Array<String> {
        return self.filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    }

    func trimWhitespace() -> Array<String> {
        return self.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}

let files = ["bank1_lf.txt", "bank2_lf.txt", "bank3_lf.txt"]

for file in files {
    let fileContent = try String(contentsOfFile: file, encoding: .utf8)
    let parts = fileContent.components(separatedBy: "\n\n")

    for part in parts {
        let lines: [String] = part.components(separatedBy: "\n").trimConc()
        print(lines)
        if (lines.count < 4) {
            print("Improperly coded question, skipping\n")
            continue
        }
        let answer = lines[lines.count - 1].components(separatedBy: ":").trimConc().trimWhitespace()
        print(answer)

        guard answer[0].starts(with: "ANSWER") else {
            print(lines)
            print("Improperly coded question, skipping\n")
            continue
        }

        let correct = answer[1]

        let correctIndex = Int(correct.unicodeScalars.first!.value - UnicodeScalar("A").value)
        let lastOption = lines[lines.count - 2]
        let lastOptionIndex = lastOption[lastOption.startIndex]
        let lastOptionIndexValue = Int(lastOptionIndex.unicodeScalars.first!.value - UnicodeScalar("A").value) + 1
        let question = lines[0..<(lines.count - lastOptionIndexValue - 1)].joined(separator: "\n")
        print(correct)
        print(question)
        let options = lines[(lines.count - lastOptionIndexValue - 1)..<(lines.count - 1)].map { $0.dropFirst(3) }.map { String($0) }.trimConc()

        questions.append(.init(question: question, options: options, count: options.count, correct: correctIndex))
        print("")
    }
}

let filteredQuestions = questions.reduce(into: (Set<String>(), [Question]())) { setAndQuestions, question in setAndQuestions.0.insert(question.question).inserted ? setAndQuestions.1.append(question) : () }.1
print("Parsed \(questions.count) questions")
print("Filtered \(filteredQuestions.count) questions")

let encoder: JSONEncoder = .init()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
let data = try! encoder.encode(filteredQuestions)
try! data.write(to: URL(fileURLWithPath: "./out.json"))
