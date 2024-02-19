import Foundation

class WordsData{
    
    func save(words : [Word]){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(words){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "words")
        }
        else{
            print("Failed to save")
        }
    }
    
    
    func getData() -> [Word]{
        let defaults = UserDefaults.standard
        var words : [Word] = []

        if let savedWords = defaults.object(forKey: "words") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                words = try jsonDecoder.decode([Word].self, from: savedWords)
            } catch {
                print("Failed to load people")
            }
        }
        return words
    }
}
