
import Foundation


struct Appetizer : Decodable , Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse : Decodable{
    let request : [Appetizer]
}


struct mockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test appetizer",
                                           description: "This is a description of my appetizer",
                                           price: 21.2,
                                           imageURL: "",
                                           calories: 30,
                                           protein: 30,
                                           carbs: 30)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    static let sampleAppetizerOne       = Appetizer(id: 0001,
                                           name: "Test appetizer",
                                           description: "This is a description of my appetizer",
                                           price: 21.2,
                                           imageURL: "",
                                           calories: 30,
                                           protein: 30,
                                           carbs: 30)
    
    static let sampleAppetizerTwo       = Appetizer(id: 0002,
                                           name: "Test appetizer",
                                           description: "This is a description of my appetizer",
                                           price: 21.2,
                                           imageURL: "",
                                           calories: 30,
                                           protein: 30,
                                           carbs: 30)
    static let sampleAppetizerThree     = Appetizer(id: 0003,
                                           name: "Test appetizer",
                                           description: "This is a description of my appetizer",
                                           price: 21.2,
                                           imageURL: "",
                                           calories: 30,
                                           protein: 30,
                                           carbs: 30)
    
    static let orderItems = [sampleAppetizerOne, sampleAppetizerTwo,sampleAppetizerThree]
}
