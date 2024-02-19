import Foundation


class SectionRepository{
    
    private var sections : [Section] = []
    
    
    func getSections() -> [Section]{
        return sections
    }
    
    func getCountSections() -> Int{
        return sections.count
    }
    
    func getSectionInstanceByIndex(index: Int) -> Section{
        return sections[index]
    }
    
    func getIdByWord(word : Word) -> String{
        return String(word.engWord.first!)
    }
    
    private func isIdExist(id : String) -> Section?{
        for section in sections {
            if section.getId() == id{
                return section
            }
        }
        return nil
    }

    private func findIndex(id : String) -> Int{
        for index in 0..<sections.count {

            if sections[index].getId() < id{
                continue
            }
            else{
                return index
            }
        }
        return sections.count
    }

}
extension SectionRepository{
    func addNewWord(word : Word){
        let id = getIdByWord(word: word)
        
        if let section = isIdExist(id: id){
            section.addWord(word: word)
        }
        else{
            addNewSection(word: word, id: id)
        }
        saveSections()
    }
    
    private func addNewSection(word : Word, id : String){
        let index = findIndex(id: id)
        sections.insert(Section(id: id, words: [word]), at: index)
        
    }
}


extension SectionRepository{
    func removeWord(indexPath : IndexPath){
        let section = sections[indexPath.section]
        let row = indexPath.row
        let word = section.getWordByIndex(index: row)
        section.removeWord(word: word)
        if section.isEmpty(){
            removeSection(index: indexPath.section)
        }
        saveSections()
    }
    
    func removeSection(index : Int){
        sections.remove(at: index)
    }
}


extension SectionRepository{
    func getSectsFromUserDefaults(){
        let defaults = UserDefaults.standard
        
        if let savedSections = defaults.object(forKey: "sections") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                sections = try jsonDecoder.decode([Section].self, from: savedSections)
            } catch {
                print("Failed to load people")
            }
        }
    }
    
    func saveSections(){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(sections){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "sections")
        }
        else{
            print("Failed to save")
        }
    }
}


