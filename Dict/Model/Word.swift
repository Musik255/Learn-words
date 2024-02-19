import Foundation

struct Word : Codable {

    public var engWord : String
    public var rusWord : String
    public var description : String? 
        
    init(engWord: String, rusWord: String, description: String? = nil) {
        self.engWord = engWord
        self.rusWord = rusWord
        self.description = description
    }
}

extension Word : Equatable{
    static func == (lhs: Word, rhs: Word) -> Bool {
        if lhs.engWord == rhs.engWord, lhs.rusWord == rhs.rusWord{
            return true
        }
        else{
            return false
        }
    }
}



