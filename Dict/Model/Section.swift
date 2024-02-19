import Foundation


class Sections{
    
    var classWords = Words(words: )
   
    var section : [Character]?
    
    
    init() {
        
        self.section = getFirstCharactersWordSorted(words: Words.words!)
        
    }
    
    
 
    
     
    
    private func allWordsOnCharacter(char : Character, words : [Word]) -> [Word]{
        
        var returnableArray = [Word]()
        for word in words {
            if word.engWord.first == char{
                returnableArray.append(word)
            }
        }
        return returnableArray
    }
    
    private func getFirstCharactersWordSorted(words : [Word]) -> [Character]{
        let allCharacters = words.map{ $0.engWord.first! }
        return Array(Set(allCharacters)).sorted(by: >)
    }
    
    static func getSectionsWithWords(){
        
    }
    
    
}
