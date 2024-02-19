import Foundation


class Section: Codable{
    private var id : String
    private var words : [Word]
    
    init(id: String, words: [Word]) {
        self.id = id
        self.words = words
    }
}

extension Section: Equatable{
    static func == (lhs: Section, rhs: Section) -> Bool {
        if lhs.id == rhs.id, lhs.words == rhs.words{
            return true
        }
        else{
            return false
        }
    }
}

extension Section: Comparable{
    static func < (lhs: Section, rhs: Section) -> Bool {
        lhs.id < rhs.id
    }
}

extension Section{
    public func getId() -> String{
        return id
    }
     
    func getWords() -> [Word]{
        return words
    }
    
    func getCountWords() -> Int{
        return words.count
    }
    
    func getWordByIndex(index : Int) -> Word{
        return words[index]
    }
    func isEmpty() -> Bool{
        return words.isEmpty
    }
    
    func addWord(word : Word){
        words.append(word)
    }
    
    func removeWord(word : Word){
        if let index = words.firstIndex(of: word){
            words.remove(at: index)
        }
    }
    
    func update(word : Word){
        if let index = words.firstIndex(of: word){
            words[index] = word
        }
    }
}





